{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-05-07";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "d64dd9e48ea2f97c596a7dfc8e3f805bad952d3e";
    sha256 = "08b0ifbb3q6pin0sf7p4q25l9mqh1q4lh00cxznrillmy92l2bbs";
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
