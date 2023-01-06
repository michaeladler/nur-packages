{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-12-13";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "c816b483fa2078dcff5ea34ff87ae5233b0abd88";
    sha256 = "0y1m7zi6hk2glzb544cyl7c3xal2qbydj69gbfm36i6zd71fzkkn";
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
