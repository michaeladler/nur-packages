{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "5.5-unstable-2026-08-31";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "055518846c3963114efbd0107bf3f2e59b4b3ba5";
    sha256 = "10448ngm9bxijvbnq6my1l8417nrrn856qxb6s47hfc2wsl0pbyr";
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
