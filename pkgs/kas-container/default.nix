{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-08-18";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "52f2c19951dd1bdd946a1e1e76f0c364aff4fd1a";
    sha256 = "1s3blbd79hlxhgfzd5mzr7b2yrp7z84gp5l7qriq384kjj33m5cq";
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
