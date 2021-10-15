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
  version = "unstable-2021-10-14";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "6575876c6600a94456fc5e9e54652a014cf313b8"; # next
    sha256 = "1jy76mflxx97p1cz67wv19a6rc5lxc2i0mmd26hydjb7c1qxjn9a";
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
