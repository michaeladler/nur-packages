{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-12-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "984927ae5630083f9c2b5cfa6ced186c565ef8bd";
    sha256 = "0k7pmnx1wd7axda73zygjlyqcb9p87pvc03s5bfyqjnxw0dk8v0a";
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
