{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-03-03";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "f3aa8303ebab83d44ea5901af8f73a6fae7ab3de";
    sha256 = "0gxbqyb1cd9d803cka37km9vczyi1k0f1pc56lhff3vln4mi44dn";
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
