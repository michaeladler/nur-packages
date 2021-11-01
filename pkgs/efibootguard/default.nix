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
}:

stdenv.mkDerivation rec {

  pname = "efibootguard";
  version = "unstable-2021-10-29";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "3c093291fca8e99bd871f45d59c4cad757b2961a"; # next
    sha256 = "01dqsal5kvp6n37wy0wh2mz23ad53z4rkp7sy5d6l8xs3x94dx4m";
  };

  nativeBuildInputs = [ autoreconfHook pkgconfig check ];

  buildInputs = [ gnu-efi zlib glibc pciutils ];

  configureFlags = [
    "--with-gnuefi-include-dir=${gnu-efi}/include/efi"
    "--with-gnuefi-lib-dir=${gnu-efi}/lib"
  ];

  meta = with lib; {
    homepage = "https://github.com/siemens/efibootguard";
    description = "Simple UEFI boot loader with support for safely switching between current and updated partition sets";
    platforms = platforms.all;
    license = licenses.gpl2Plus;
  };
}
