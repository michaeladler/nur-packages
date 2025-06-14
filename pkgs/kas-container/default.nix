{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-06-13";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "aad407493fe97d0e8bf0f9c2ee292ee9632b8267";
    sha256 = "1qg4k4xq2f5ib0bsiwimfk268jy2nq79y6klr9jj9kp5ig8rc54n";
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
