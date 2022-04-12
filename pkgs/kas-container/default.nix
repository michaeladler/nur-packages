{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-04-06";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "09291011047844f7df024ea13c5322840185d8c5";
    sha256 = "18r4yc2lwiggvv8v1fjmbh4fz9fjvl336rxfwb1pf80ksqjx63qs";
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
