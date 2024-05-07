{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-05-03";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "911da6ddf59a8f029534d75e55301b69d94b4aa2";
    sha256 = "1c2dxxsh03ig3nvwwpzp6vzwsgfbn134jy1hi77dmnfy3lcq894p";
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
