{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-04-24";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "8a3a71d9334b26a8ea9e5353592f7d2331a528f2";
    sha256 = "13nmn4cvbjql8fgp30n2rv3lv0a31wr758ayziv4gm7lshdz86h9";
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
