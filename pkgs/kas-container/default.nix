{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-05-19";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "b06fe8a0b7ffaab52adc83bca9c6193c8a237619";
    sha256 = "1y7g4saa7dy1y3nr3y2qd1lazbafa753hl838zgxd8nnbqcndyv9";
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
