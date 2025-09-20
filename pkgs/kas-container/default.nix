{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-09-15";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "98dac70a3d06f2b26a89df88f58a8743f5701f3e";
    sha256 = "14xs6k0r2pqjzfbyfbzqx5if1rm29kv711hw45jrngxih503c639";
  };

  installPhase = ''
    install -D -m0755 kas-container $out/bin/kas-container
  '';

  meta = with lib; {
    homepage = "https://github.com/siemens/kas";
    description = "Setup tool for bitbake based projects";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
