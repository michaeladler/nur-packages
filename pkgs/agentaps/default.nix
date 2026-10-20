{
  lib,
  craneLib,
  fetchFromGitHub,
  nix-update-script,
  pkg-config,
  gtk4,
  qt6,
  alsa-lib,
  fontconfig,
  freetype,
  libxcb,
  libxkbcommon,
  wayland,
  vulkan-loader,
  makeWrapper,
}:

(craneLib.buildPackage rec {

  src = fetchFromGitHub {
    owner = "domenkozar";
    repo = "agentaps";
    rev = "70d537a88a4707ee7b1e26c61339537eaf29f423";
    sha256 = "0bf75n93pq1jjnldinaq2yhr8aa9p7b72hmg6b70yghw537rck1k";
  };

  # glib-sys probes glib-2.0 and native-theme-qt probes Qt6Widgets, so the
  # deps-only build needs the same libraries as the final build.
  guiDeps = [
    gtk4
    qt6.qtbase
    alsa-lib
    fontconfig
    freetype
    libxcb
    libxkbcommon
    wayland
    vulkan-loader
  ];

  cargoArtifacts = craneLib.buildDepsOnly {
    inherit src;

    nativeBuildInputs = [
      pkg-config
    ];

    buildInputs = guiDeps;

    # keep deps-only feature set identical to the final build, otherwise it also
    # compiles gpui-libghostty (default feature), whose build script needs zig
    cargoExtraArgs = "--locked --no-default-features";

    # deps-only build only needs qtbase for its .pc files, not its wrapping
    dontWrapQtApps = true;

    strictDeps = true;
  };

  nativeBuildInputs = [
    pkg-config
    qt6.wrapQtAppsHook
    makeWrapper
  ];

  buildInputs = guiDeps;

  doCheck = false;

  # ghostty-terminal needs zig to build its C shim
  cargoBuildExtraArgs = "--no-default-features";

  postInstall = ''
    install -Dm444 ${./agentaps.desktop} $out/share/applications/agentaps.desktop
    install -Dm444 ${src}/assets/packaging/icon.png \
      $out/share/icons/hicolor/512x512/apps/agentaps.png
  '';

  postFixup =
    let
      runtimeDependencies = guiDeps;
    in
    ''
      wrapProgramShell $out/bin/agentaps \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeDependencies}"
    '';

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=branch"
    ];
  };

  # cachix needs cargoArtifacts pushed separately: buildDepsOnly output is a
  # build-time input, so it is not part of the package's runtime closure.
  passthru.cargoArtifacts = cargoArtifacts;

  meta = {
    description = "A universal GUI for coding harnesses";
    homepage = "https://github.com/domenkozar/agentaps";
    license = lib.licenses.asl20;
  };
}).overrideAttrs (_: {
  # crane derives version from Cargo.toml; redefine it here so nix-update can
  # locate and bump it inside this flake instead of crane's store path.
  version = "0.6.0-unstable-2026-10-19";
  __intentionallyOverridingVersion = true;
})
