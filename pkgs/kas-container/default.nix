{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-03-14";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "772cb5748b1e32ccdaf752c2f36cfb3e54e34144";
    sha256 = "15f5i8k6m1lps98qjjhjmr98bvh6h8iqz3xb23b3k2x82y4ihxxw";
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
