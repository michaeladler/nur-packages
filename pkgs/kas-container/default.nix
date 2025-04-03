{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-03-27";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "aa37a293c44887b422a775eb9a531fd247c1d855";
    sha256 = "07w5zsv35578cq0dhsv1v2nxw67v9k7n2vx1lr9ynznryngm4v0j";
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
