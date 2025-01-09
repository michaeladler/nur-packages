{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-01-07";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "e7516cbeac990797dda6b7d3680c9b2cb496e146";
    sha256 = "1jpvid0dlc2ia8nnay5203b3nx84f0c4vpnd1h4g4lb6wl3zy6q3";
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
