{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-04-23";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "6131038c00fd778c94f4701edc32fbab898ef4fe";
    sha256 = "1qxapanfqnrlmcdi14cikaxbqjsg8mfg1i3maischqgbmm3gzlw8";
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
