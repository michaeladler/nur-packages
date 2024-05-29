{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-05-24";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "1ff40f4d4f2c78818627e2950e67f67a76be5407";
    sha256 = "12cbsripsxf5vqm9285v19s4fkgi3f3dmdbr0crywqb9q3fbax8p";
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
