{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-09-15";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "247d9c24be93bae57b43a57ef1e5675cfc89914a";
    sha256 = "015a6hvixha5r8wk2dvyhyldj7p53qcc4samvy9rpyxwc75k5bi7";
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
