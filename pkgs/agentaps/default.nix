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
  version = "0.4.0-unstable-2026-10-05";

  src = fetchFromGitHub {
    owner = "domenkozar";
    repo = "agentaps";
    rev = "85e6422257495845f1b7574705b40b1fd0afa8ba";
    sha256 = "sha256-rPCCSvIMJQsAuGtEDuaAKUcvzhFOk5QhRfmk3sma5o0=";
  };

  cargoHash = "sha256-KM/djQsiAZafmP+t8F6DQkvroCPnx59oTBKDxtK5/yU=";

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
      "--version=branch"
    ];
  };

  meta = {
    description = "A universal GUI for coding harnesses";
    homepage = "https://github.com/domenkozar/agentaps";
    license = lib.licenses.asl20;
  };
})
