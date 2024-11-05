{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-10-31";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "f4ceea72d0a9d571e0a8ae2879ae0616758161df";
    sha256 = "0qvi0by0xrsk1la984c5pbmkfa0xwbgbxm2fga9zyf09xr4vi6ac";
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
