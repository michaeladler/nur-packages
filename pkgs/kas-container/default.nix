{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-09-19";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "7b26b5edf0e874ce675741579919331e2b69e600";
    sha256 = "1py09qh1n7yghns7djd3czpmbid5gdlrrwri2j4irz77kjdpxydn";
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
