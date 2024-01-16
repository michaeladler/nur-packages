{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-01-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "afe6fe81c4733fe5052b944ad16e755debc4d6d3";
    sha256 = "1wyg4nhzbh0sj03331i54vafs3jrlyngshhc2020qpnx8x3zx83b";
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
