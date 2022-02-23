{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-02-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "d7af4dc678176dfc2c53091b6e3f19070d5b6ee1";
    sha256 = "0j12lx4zq0lnadz9ipsxv16rjc047n19gv28snfp7i315qbw0gbr";
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
