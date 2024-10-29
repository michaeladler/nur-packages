{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-10-25";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "9e026b615bf3f11f9691f63f31ae8719ad5d173d";
    sha256 = "1s56k7ha8wad3k4i164yz2na16jf59v7p92mh1nfisnlrjvqc70s";
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
