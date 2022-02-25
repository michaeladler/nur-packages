{ stdenv
, lib
, fetchFromGitHub
, autoreconfHook
, pkgconfig
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
  version = "unstable-2022-02-24";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "99435e3d7ac960883c951db151ff3ac3c4088458";
    sha256 = "06nwc20a9l66hxzy5haj6dlzy1c3gr4fi9jlg28wjd3m25fv0g5z";
  };

  nativeBuildInputs = [ autoreconfHook pkgconfig check (python3.withPackages (ps: with ps; [ shtab ])) installShellFiles ];

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
