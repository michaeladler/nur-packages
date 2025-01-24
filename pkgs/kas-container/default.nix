{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-01-21";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "076564c62367e7efc8dfcab81c0a9c3343bc9ca4";
    sha256 = "0mar1fb6qnsqzbn9n086w0ykfn62h2ibf0p7axm3b4hsih5ilj0w";
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
