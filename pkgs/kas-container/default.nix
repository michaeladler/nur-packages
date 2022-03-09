{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-03-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "680c67d756c99d7c302b985f342900dde298c7c6";
    sha256 = "0jp6p9khpv14l6b9aa93826wlv48hglyh95fwybnw1g467qxd41c";
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
