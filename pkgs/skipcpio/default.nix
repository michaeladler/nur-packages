{ stdenv, lib, fetchurl, pkg-config }:

stdenv.mkDerivation rec {
  pname = "skipcpio";
  version = "unstable-2022-08-18";

  src = fetchurl {
    url = "https://github.com/dracutdevs/dracut/raw/aa0369a4a31764fde06214358b0774fb1095af01/src/skipcpio/skipcpio.c";
    sha256 = "195nlglv3zxzc6mvq70c0m9zj683z0wm9a32x5v6fphmsrd8m59a";
  };

  buildInputs = [ pkg-config ];

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];

  unpackPhase = ''
    cp $src skipcpio.c
  '';

  buildPhase = ''
    cc -O2 -o skipcpio skipcpio.c
  '';

  installPhase = ''
    install -D -m0755 skipcpio $out/bin/skipcpio
  '';

  meta = with lib; {
    homepage = "https://github.com/dracutdevs/dracut";
    description = "skip parts of initramfs";
    platforms = platforms.linux;
    license = licenses.gpl2Plus;
  };
}
