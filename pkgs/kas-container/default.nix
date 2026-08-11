{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-08-03";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "dcbd85cdd303e218d497132627053c7de5bf1e8c";
    sha256 = "0ci3j2455xmqcvw7rxwhlpjh9frfc09bv22dgfi8gm7i0pz8qr1v";
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
