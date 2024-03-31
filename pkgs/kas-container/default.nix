{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-03-25";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "e700729a9155d9a62682aef3aa0379597485cd7e";
    sha256 = "00224nk3cscipxyndrcdhp1iv3r8ll6w3fnnanhzm8xmk9cf6bhh";
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
