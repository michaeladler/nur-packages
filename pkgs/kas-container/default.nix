{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-04-25";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "aaa7148464b0e97907af578f7f1e72e79bfa3a3c";
    sha256 = "07pbk5fxnl3pkyslxlrn80plvgp7papgnmm8rc40jcqlxw2w5axk";
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
