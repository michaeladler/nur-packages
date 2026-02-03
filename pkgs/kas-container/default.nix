{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-01-30";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "9efb04393814f7b1dcbdc904e3dcb8a87b619cb0";
    sha256 = "097301ka91bpzjd8m2q5fvplvzzr1a7viahx5qjr0x9ir8mpksfq";
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
