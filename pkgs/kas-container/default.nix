{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-05-27";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "d13ad3a59d8d56dded4ecdee5886076a0f8d6dc6";
    sha256 = "1094d3s5xdk1z9m0r48iws706q2n5q6k1fbx1sqdjw2z2gq2xq2x";
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
