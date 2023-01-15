{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-01-13";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "e9fac8dda7232eae925ab0fb04a08045e7659897";
    sha256 = "1f9fj97yn8wkmqdz1b3sxsygg6rdd1f8l3zwh00kkli1w6nia5xx";
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
