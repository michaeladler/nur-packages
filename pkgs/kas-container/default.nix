{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "5.5-unstable-2026-10-27";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "a22be931429dd2b3a8887f96bcf04b3f3e9c29f1";
    sha256 = "sha256-tMxg3lVHI53NzCcFRwP2zqV5DgPdKkS+A+LbOZ8kG1I=";
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
