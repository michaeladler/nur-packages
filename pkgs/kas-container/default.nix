{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2021-11-29";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "75d1a5cce49f363b4dacd702a48d3b11195a353c";
    sha256 = "00haklnj0qfa2a8dgacsd9nf2agckc6cw22jx6i2bi84rph34f6q";
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
