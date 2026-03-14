{
  stdenv,
  lib,
  rustPlatform,
  fetchFromGitHub,
  libGL,
  libinput,
  pkgconf,
  xkeyboard_config,
  libgbm,
  pango,
  udev,
  shaderc,
  libglvnd,
  vulkan-loader,
  autoPatchelfHook,
  installShellFiles,
}:

rustPlatform.buildRustPackage {
  pname = "jay";
  version = "1.11.1-unstable-2026-03-13";

  src = fetchFromGitHub {
    owner = "mahkoh";
    repo = "jay";
    rev = "31f865441bd3ca18b4262bc9fe54e5c8e2eacbd3";
    sha256 = "sha256-4HoKjddWLOu12KPm2osZVIGyOjQ1ajIh0dl0vBQk3tw=";
  };

  cargoHash = "sha256-y6Z57W6K9yNOseTcJ5EVpdiQwl2+ZtGKblvqyi4Ok9w=";

  env.SHADERC_LIB_DIR = "${lib.getLib shaderc}/lib";

  nativeBuildInputs = [
    autoPatchelfHook
    pkgconf
    installShellFiles
  ];

  buildInputs = [
    libGL
    xkeyboard_config
    libgbm
    pango
    udev
    libinput
    shaderc
  ];

  runtimeDependencies = [
    libglvnd
    vulkan-loader
  ];

  postInstall = ''
    install -D etc/jay.portal $out/share/xdg-desktop-portal/portals/jay.portal
    install -D etc/jay-portals.conf $out/share/xdg-desktop-portal/jay-portals.conf
  ''
  + lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    for shell in bash fish zsh; do
      installShellCompletion --cmd jay --$shell <($out/bin/jay generate-completion $shell)
    done
  '';

  meta = {
    description = "Wayland compositor written in Rust";
    homepage = "https://github.com/mahkoh/jay";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ dit7ya ];
    mainProgram = "jay";
  };
}
