{ stdenv, lib, fetchFromGitHub, pkg-config }:

stdenv.mkDerivation rec {
  pname = "skipcpio";
  version = "unstable-2023-02-13";

  src = fetchFromGitHub {
    owner = "dracutdevs";
    repo = "dracut";
    rev = "a6dd5bfb9a514a3bf650cc1e8d4311c05e9b968c";
    sha256 = "0knnmk8sximvxjf5lfxrr8s9z0kkkcn7ssnbrwkm4aw5p7ski3hc";
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
