{ stdenv
, lib
, fetchFromGitHub
, autoreconfHook
, autoconf-archive
, pkg-config
, check
, gnu-efi
, zlib
, glibc
, pciutils
, python3
, python3Packages
, installShellFiles
}:

stdenv.mkDerivation rec {

  pname = "efibootguard";
  version = "unstable-2024-08-30";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "9e34f8b45262eedea6cb212445f81ed70cde5d9b";
    sha256 = "0nrrxh3irr4k2ipqkg2jsw3h7c9j21f816dkhrs04r3jvs62lyjn";
  };

  nativeBuildInputs = [
    autoreconfHook
    autoconf-archive
    pkg-config
    check
    (python3.withPackages (ps: with ps; [ shtab ]))
    installShellFiles
  ];

  buildInputs = [ gnu-efi zlib glibc pciutils ];

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
