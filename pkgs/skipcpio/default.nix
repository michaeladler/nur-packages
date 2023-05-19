{ stdenv, lib, fetchFromGitHub, pkg-config }:

stdenv.mkDerivation rec {
  pname = "skipcpio";
  version = "unstable-2023-05-18";

  src = fetchFromGitHub {
    owner = "dracutdevs";
    repo = "dracut";
    rev = "1843c16cafff005f798c379225e97dce459bc3dd";
    sha256 = "0g78k4fy3ln35bxd301ymb3mhppp758nangfsqxk4c19gfg9asnx";
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
