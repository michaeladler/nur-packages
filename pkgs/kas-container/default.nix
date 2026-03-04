{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-02-27";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "21a3162cf39f9eacd5023b072aa98129e1c071ec";
    sha256 = "1b1xkxsv62wws0vrksiws4zwlq799c0xh9g002w29yzkrlhsxi29";
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
