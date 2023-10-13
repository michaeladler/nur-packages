{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-10-06";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "5c765487dad5b7d732f3211c5c34c6af064223b9";
    sha256 = "1hsq7a5ka6lf6bbv9r2yzhffr34l6d6pwj2jc0p1dwn13778rqa9";
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
