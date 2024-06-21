{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-06-20";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "422e6032f6a86aa7a3d47671e31f08650e5bd228";
    sha256 = "0lb9l9i2was1638ciiq3jx44lyckrswgp3bwp1vl3afzr71gfp4y";
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
