{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-12-20";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "4cf4ce52beff23ff9096347784e618a23c1c8e9b";
    sha256 = "0yqw79x7c3rgwa8arqrv2j0z40bar0rv16cqci74i6bzjb1i78c5";
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
