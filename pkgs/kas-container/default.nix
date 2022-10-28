{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-10-19";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "102c4667d1ba993dca9d372910d9eecf1066993e";
    sha256 = "1j88pviqss5calbvh7401g4v69vp36bbifn0f7p2g4jx1wclmznc";
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
