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
  version = "1.12.0-unstable-2026-03-19";

  src = fetchFromGitHub {
    owner = "mahkoh";
    repo = "jay";
    rev = "107245d8779c0dbc38658e005a8390150e2aae05";
    sha256 = "sha256-iqG/pxj1NIVZzbBCbgpPp4hb/B7napS81KJSaXVasjw=";
  };

  cargoHash = "sha256-wK9v3YwP067etFAu6Ca9Sts+QrD4uL48chbL6tZKFkk=";

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
    install -D etc/jay.desktop $out/share/wayland-sessions/jay.desktop
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
