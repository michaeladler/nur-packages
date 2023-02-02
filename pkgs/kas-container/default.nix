{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-02-02";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "66893480c7471aff541d0869d9e27b81c2b13dbd";
    sha256 = "0k2kr3id2v41lwh90ryjc94pn9mvlagnqda1gazfsa19a9wljm4k";
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
