{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-11-15";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "1a2de8daa7a5f72becd827e22eebf6abb7ffad4f";
    sha256 = "1sqnl0rx1m93si12igkl77ra8a8qjph95cvdyj3frd9dcpbg4jsd";
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
