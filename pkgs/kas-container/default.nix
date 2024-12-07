{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-12-06";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "6a4a8d87eb625558e93df94cf958022d5496cb03";
    sha256 = "14hd5nwq61q725ix1kr5wxwn32fd41j0r3sg6rh8kdzsflgvs8jr";
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
