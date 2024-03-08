{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-03-05";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "435650ca3a4f9571b041f1f3f1277486183f3785";
    sha256 = "0f7ysjs8n4502xrc6i9prlbnsrl8ldbnar8qip40yygdfzi5azgl";
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
