{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-03-11";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "f650ebe2495a9cbe2fdf4a2c8becc7b3db470d55";
    sha256 = "0a9a8qsn3air0icim1p47c2qjgn6sc34yvfv48w8m2qyi8gvmsfc";
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
