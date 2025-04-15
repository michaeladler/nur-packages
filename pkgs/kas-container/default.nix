{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-04-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "f44176ff5aae57213b8f9df12f07759ac717831c";
    sha256 = "0ps0z26kz1h01vbpbfcxj36c7lq5i398g6r1p77j9dp63dgwyy76";
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
