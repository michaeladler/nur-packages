{ stdenv, lib, fetchFromGitHub, pkg-config }:

stdenv.mkDerivation rec {
  pname = "skipcpio";
  version = "unstable-2023-03-06";

  src = fetchFromGitHub {
    owner = "dracutdevs";
    repo = "dracut";
    rev = "e9b4774239989257999053033fc92cded7803896";
    sha256 = "00zfcz0rvvkz5qmpsy805ac67ll9g76hz7pm9a14fz78fa2h4rfr";
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
