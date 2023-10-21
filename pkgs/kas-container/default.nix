{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-10-18";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "af82e383a0346dfb31171fc689cb9ca7ffe14d64";
    sha256 = "1g5p528apxcznak7pfvkb2sjs67sndsp53l6id2z8mnvamljpw4b";
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
