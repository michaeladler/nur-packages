{
  lib,
  stdenv,
  fetchFromForgejo,
  zig_0_17,
  pkg-config,
  gtk4,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "ssh-askpass-zigtk";
  version = "0.2.0-unstable-2026-11-11";
  strictDeps = true;
  __structuredAttrs = true;

  src = fetchFromForgejo {
    domain = "tty.fail";
    owner = "mrus";
    repo = "ssh-askpass-zigtk";
    rev = "4166bdebe3605de6d96e4856aeaa53546e53db1c";
    hash = "sha256-kqH8WHY0eohZ6lGIsFxX/i/4yhQWke5F9kFa2iYN/Eg=";
  };

  nativeBuildInputs = [
    zig_0_17
    pkg-config
  ];

  propagatedBuildInputs = [ gtk4 ];

  doCheck = true;

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=branch"
    ];
  };

  meta = {
    description = "ssh-askpass using GTK4 without X11 dependencies and written in Zig";
    homepage = "https://tty.fail/mrus/ssh-askpass-zigtk";
    license = "SEGV";
    maintainers = with lib.maintainers; [ haansn08 ];
    platforms = lib.platforms.all;
    mainProgram = "ssh-askpass-zigtk";
  };
})
