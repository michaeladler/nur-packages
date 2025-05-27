{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-05-19";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "50e53fa2620fb34ea2ae220f4ca72ba68e898448";
    sha256 = "0r1j89qj589k9pqdq3380vbnkj9kwkl35ciw9f320d3l9pxfp8bm";
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
