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
}:

stdenv.mkDerivation rec {

  pname = "efibootguard";
  version = "unstable-2021-11-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "e499d403d6049119a4e75c6145678ce9d3e82b64"; # pin
    sha256 = "13y3c8b8jsff80k9cdwx23i1gv3b5nmvbm9w86qnf343pnr6ddp5";
  };

  nativeBuildInputs = [ autoreconfHook pkgconfig check python3 ];

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
