{ stdenv, lib, fetchFromGitHub, pkg-config }:

stdenv.mkDerivation rec {
  pname = "skipcpio";
  version = "unstable-2023-04-11";

  src = fetchFromGitHub {
    owner = "dracutdevs";
    repo = "dracut";
    rev = "297525c5c0781e13c4bf86aa42e81b9f166802ad";
    sha256 = "15lz7mya5n19a3rarsjcfp0hsvhg33g9f963lzigcrk1ibkysxix";
  };

  buildInputs = [ pkg-config ];

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];

  patchPhase = ''
    patchShebangs configure
  '';

  configurePhase = false;

  buildPhase = ''
    make src/skipcpio/skipcpio
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv src/skipcpio/skipcpio $out/bin/
  '';

  meta = with lib; {
    homepage = "https://github.com/dracutdevs/dracut";
    description = "skip parts of initramfs";
    platforms = platforms.linux;
    license = licenses.gpl2Plus;
  };
}
