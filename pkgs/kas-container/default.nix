{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-05-15";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "bad34c59da4927f4b3730a524136a438fb9174e3";
    sha256 = "12kxfwl6dajvzprn9982b87j45xjbm50mrp3igym32j7dp8hiym4";
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
