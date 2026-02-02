{
  stdenv,
  lib,
  fetchFromGitHub,
  autoreconfHook,
  autoconf-archive,
  pkg-config,
  check,
  gnu-efi,
  zlib,
  glibc,
  pciutils,
  python3,
  python3Packages,
  installShellFiles,
}:

stdenv.mkDerivation rec {

  pname = "efibootguard";
  version = "unstable-2026-01-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "9ac678328583700c61511c116fc16926e8dd8b32";
    sha256 = "0kz514msv60chwmk4sy9h6wv65arm09gk7xpn7pqr8na2xh3wh7z";
  };

  nativeBuildInputs = [
    autoreconfHook
    autoconf-archive
    pkg-config
    check
    (python3.withPackages (ps: with ps; [ shtab ]))
    installShellFiles
  ];

  buildInputs = [
    gnu-efi
    zlib
    glibc
    pciutils
  ];

  configureFlags = [
    "--with-gnuefi-include-dir=${gnu-efi}/include/efi"
    "--with-gnuefi-lib-dir=${gnu-efi}/lib"
  ];

  postInstall = ''
    installShellCompletion --zsh --name _bg_printenv $out/share/efibootguard/completion/zsh/_bg_printenv
    installShellCompletion --zsh --name _bg_setenv $out/share/efibootguard/completion/zsh/_bg_setenv

    installShellCompletion --bash --name bg_printenv.bash $out/share/efibootguard/completion/bash/bg_printenv.bash
    installShellCompletion --bash --name bg_setenv.bash $out/share/efibootguard/completion/bash/bg_setenv.bash

    rm -rf $out/share/efibootguard/completion
  '';

  meta = with lib; {
    homepage = "https://github.com/siemens/efibootguard";
    description = "Simple UEFI boot loader with support for safely switching between current and updated partition sets";
    platforms = platforms.all;
    license = licenses.gpl2Plus;
  };
}
