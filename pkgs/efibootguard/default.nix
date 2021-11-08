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
  version = "unstable-2021-11-07";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "15aa3731e860f1cdd43cb5a33e4e1bccc29769c3"; # next
    sha256 = "0jyczwmfi2njhp3pydvgavafdamimsc2rj1l7n3i4lgs2i90r2ng";
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
