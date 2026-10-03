{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
  pkg-config,
  gtk4,
  qt6,
  fontconfig,
  freetype,
  libxcb,
  libxkbcommon,
  wayland,
  vulkan-loader,
  makeWrapper,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "agentaps";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "domenkozar";
    repo = "agentaps";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-/DIcohzFT0Rm6alPhBnuvJuKh6lAHwDkZJ3jwUCyDZA=";
  };

  cargoHash = "sha256-R2VPjxwElvLPbikwuxILwV7ShSOy3mJjqinaK8dNipk=";

  nativeBuildInputs = [
    pkg-config
    qt6.wrapQtAppsHook
    makeWrapper
  ];

  buildInputs = [
    gtk4
    qt6.qtbase
    fontconfig
    freetype
    libxcb
    libxkbcommon
    wayland
    vulkan-loader
  ];

  doCheck = false;

  postInstall = ''
    install -Dm444 ${./agentaps.desktop} $out/share/applications/agentaps.desktop
    install -Dm444 ${finalAttrs.src}/assets/packaging/icon.png \
      $out/share/icons/hicolor/512x512/apps/agentaps.png
  '';

  postFixup =
    let
      runtimeDependencies = [
        gtk4
        qt6.qtbase
        fontconfig
        freetype
        libxcb
        libxkbcommon
        wayland
        vulkan-loader
      ];
    in
    ''
      wrapProgramShell $out/bin/agentaps \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeDependencies}"
    '';

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=stable"
    ];
  };

  meta = {
    description = "A universal GUI for coding harnesses";
    homepage = "https://github.com/domenkozar/agentaps";
    license = lib.licenses.asl20;
  };
})
