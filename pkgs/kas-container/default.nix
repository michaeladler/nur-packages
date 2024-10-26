{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-10-23";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "66b7d795d64b3aefd891023043e9b26d68f3807f";
    sha256 = "03m8nsmmm947c1dr7m0n92213h1pppq34hhzs85cbw1i8arwxldq";
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
