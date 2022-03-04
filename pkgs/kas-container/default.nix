{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-03-03";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "41b52b126314836b3d3497032dfe0cb3781e7fb5";
    sha256 = "00hxxxl1rfxndkksymn9w4wvwg042962g2dipzryysmzc34fk09h";
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
