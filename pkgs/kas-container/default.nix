{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-07-06";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "8a82d22f123ea9242eabb91334b654dcf7410b7f";
    sha256 = "07psirlywa0hynfpif0cbdmcjynx3wx11hd6p2la8a054b1ajwn9";
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
