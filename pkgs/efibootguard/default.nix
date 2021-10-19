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
  version = "unstable-2021-10-18";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "c01324d0da202727eb0744c0f67a78f9c9b65c46"; # next
    sha256 = "1vidlc5jlwd13r2wkr99x7yhy3yk9xia6kwgk0m46lx3r5yb7875";
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
