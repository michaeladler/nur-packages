{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-06-20";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "a560dde924a9e6bdbdd74b901d71a450bec44646";
    sha256 = "105z1kqspb1vafhqv9ijdxixbz01qg4w46a1a40qg0s9s691vhpx";
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
