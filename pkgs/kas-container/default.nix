{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-06-19";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "567950bc53c0106acc53076628c82cf9796fe7c8";
    sha256 = "095znjvw7f821rgz2dpdf8i90nyl6gbhgxy1ba96m4chrql2mcyb";
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
