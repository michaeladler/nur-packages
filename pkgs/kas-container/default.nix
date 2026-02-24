{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-02-23";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "09cb11b1aad4884f5ad55d3c237f216dbbe97f8f";
    sha256 = "0ka0vkd8nn9adhw3m3shsg9xcz8gyda0ci2k3wg9f4shic960j4l";
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
