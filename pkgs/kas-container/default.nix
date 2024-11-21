{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-11-15";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "acfa8b61bf2399f4483d13438bb8c9d819804d85";
    sha256 = "13j87axh15yi87bjm9m40iyzp97vcsayjzq4b0qvaip96nnwbh8j";
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
