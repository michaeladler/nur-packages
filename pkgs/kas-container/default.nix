{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-06-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "2f149509c2fee497ac3d02aaa12e920b8e18cecb";
    sha256 = "0sbwkcv5n6qlg60klk81bjyd1scw4ssq9kw2ijdm1h135fsp0pm8";
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
