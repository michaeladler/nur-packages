{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-08-12";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "a285163f3e6b4357cd9ba78d30e502c1a26a30e9";
    sha256 = "1lxzr6pjb0np0rk50xgk4yr1qvxllpi8qvj433z0kjaay9v911sb";
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
