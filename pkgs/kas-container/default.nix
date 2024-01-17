{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-01-16";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "23211cbd3518936d83169722d1eb40656344ba27";
    sha256 = "085dnrrwxqn44gw35nmcrkj4dca623gp839qfnr5g35659q4ycrn";
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
