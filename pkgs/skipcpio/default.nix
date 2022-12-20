{ stdenv, lib, fetchFromGitHub, pkg-config }:

stdenv.mkDerivation rec {
  pname = "skipcpio";
  version = "unstable-2022-12-19";

  src = fetchFromGitHub {
    owner = "dracutdevs";
    repo = "dracut";
    rev = "e0d57a8f5b15847a7fbae2ed3df29ec2c5d25ec7";
    sha256 = "0zlcfhijrgff6wb60pc0p4fqm0sqpc5ksg0wzm2vgqx3a6hvjxc6";
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
