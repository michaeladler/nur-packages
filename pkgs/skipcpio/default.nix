{ stdenv, lib, fetchFromGitHub, pkg-config }:

stdenv.mkDerivation rec {
  pname = "skipcpio";
  version = "unstable-2022-11-04";

  src = fetchFromGitHub {
    owner = "dracutdevs";
    repo = "dracut";
    rev = "415e5519d19e24d123378710abe47a2df2b22e7b";
    sha256 = "0fpwdx1174xr0kg91ncfp79kmwiqdbb90ysz659dc7s1iymgcqh1";
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
