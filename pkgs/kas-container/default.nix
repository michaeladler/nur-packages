{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-01-09";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "f3521f82fa41c07ea8bdd8370a2ce045947165cc";
    sha256 = "0vlc68a0xl9plnnwk5icgcjhd58dlnadxj1yxsl14lg6iph9fxpj";
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
