{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-12-05";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "c5191c80e6471a95ec2556072173219f18502095";
    sha256 = "02y01m4ml2v7nm4gy4h8lzzbpaw0n4j2857khlkc93cvdm3ah1s9";
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
