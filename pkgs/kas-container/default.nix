{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-06-09";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "207d236bae183eebbd00e1d845eec1ece69a75bf";
    sha256 = "1qk60svr69q6z0vv69hgqv9yvmhcx435fp5fy6f9lbmzm7v0cqpp";
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
