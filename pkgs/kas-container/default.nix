{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2026-08-21";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "77468d740732cbe992d7e34b5f645d39b3e186aa";
    sha256 = "0mmxjqpp1331jyp7nk476vzmrzix1hh4sxbw08m3m91nxq58w9p3";
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
