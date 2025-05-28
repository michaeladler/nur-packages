{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-05-26";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "117e4d978b9ad3e958bbd7a6343a769396d5e627";
    sha256 = "06a45bimlkx5bjhf60as8xj39zk5ahlw0zxllah0sk5vwd7m6qkb";
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
