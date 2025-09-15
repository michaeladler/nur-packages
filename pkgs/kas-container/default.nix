{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-09-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "92adcc4844577ce30cc90a69e587384bca4d37cc";
    sha256 = "1mvz1zx0a3vrzs8w4kz1dc9v8al26gd7nsardx1db8ffb2f6qaia";
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
