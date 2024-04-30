{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-04-25";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "b3656d321e6e223b579d1ca2ca9bccfa06ff2084";
    sha256 = "1wf7hbssfpni2pmq9v4z3wvp076yv57x4a1j98j7xp52f7xsl78r";
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
