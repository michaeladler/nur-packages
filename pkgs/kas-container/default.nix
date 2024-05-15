{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-05-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "c9f700ee3135d8a4a07abed25f8b27b8f3326605";
    sha256 = "0ppwr80b7yd1117p7ajil4524k49cp9x43bq2mlzh8x33x58r9y2";
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
