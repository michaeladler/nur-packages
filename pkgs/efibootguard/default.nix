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
  version = "unstable-2021-11-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "fea44c6798fb5f5bfc0f2bcdda8b365e90ee20f2"; # next
    sha256 = "1pygz5fbxjzriwvdvk8l0j35p4yz2ppggbkhb6rszpgvxc2cqnk2";
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
