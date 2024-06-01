{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-05-31";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "37f843356b72c91e2833c7e486ff433b4eeb1db2";
    sha256 = "1zmmck3qz6ki7dak1z44shwdzha96nnip769r2rps6njl7brbkf2";
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
