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
  version = "unstable-2022-05-05";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "9225675095c91df51d66a4b8c5e17700401382fc";
    sha256 = "1w9w7k4l2r3knnb6y0i76bi0w0qnszmnsir0hqi0hlyhyn8fy5vr";
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
