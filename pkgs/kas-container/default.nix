{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-01-17";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "34cf4c9c8f1313257940c20e4551a11b6a77a8c9";
    sha256 = "01m7kxfs1rq85c9dc9rdd2qhy65h3pxk6gp3y7ii3iay9av1fbl9";
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
