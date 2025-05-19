{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-05-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "ba07f3250b651a731569a8bdceb4d895215f6c4b";
    sha256 = "1y3xzdlvmdvfx19d7hq3mm20wd6x2864zs16i49y8xb5czblv3n5";
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
