{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-05-29";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "c9e4f67a1a8a7310f81519954370241bba4981c2";
    sha256 = "1k93rrhm74ixv74cb23i5zvyk1mi3rbnmalckmc2gf8pswmcg8g2";
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
