{ stdenv, lib, fetchFromGitHub, pkg-config }:

stdenv.mkDerivation rec {
  pname = "skipcpio";
  version = "unstable-2023-07-31";

  src = fetchFromGitHub {
    owner = "dracutdevs";
    repo = "dracut";
    rev = "403f4e8e15da4fdc84f3d32a0f231eeb9b2e4ed0";
    sha256 = "07243fahx8dcznzd95aav3626zcb99mbvxwcl27j05vgkhh5x5ym";
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
