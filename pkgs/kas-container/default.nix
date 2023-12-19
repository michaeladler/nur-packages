{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-12-12";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "365cec1a90abedf91db2e4c7962fbf8767d80548";
    sha256 = "1vn4lgfa9sk6k95zbhps198vvv75vgx0kizab8ysaavfn9xc00is";
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
