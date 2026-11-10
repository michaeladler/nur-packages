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
    rev = "33fe08f9eb1e681d3eefbb88023c1f20a79c35b6";
    sha256 = "sha256-ENbAIe1U3SneP8wyNfcgSyaHr8JzmwhsnknscO+mgy4=";
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
  version = "0.7.0-unstable-2026-11-05";
  __intentionallyOverridingVersion = true;
})
