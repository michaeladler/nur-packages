{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-03-04";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "f1d5f1399cd6d325c698a782e233bd608d1783ba";
    sha256 = "08r2mrwsxx7h2c40psdz776fjgjagkpqgn1n4lg384vsnrrbjljw";
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
