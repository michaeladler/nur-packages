{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-11-28";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "43d12cbb6cae0e7874b44928740db2d67eb706dc";
    sha256 = "10dr00yj5xlpd1ddvaqi7q9aia1hgn3651w7cgw5x8s6xkhq5325";
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
