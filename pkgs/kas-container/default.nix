{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-12-21";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "eed99a1d429cdf10e55038611cfbfa56ab2734bf";
    sha256 = "0n2l1yd6y2i3zhfmrcyzpnljbxv681a27r0s5g1qmrxmvavqaz9s";
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
