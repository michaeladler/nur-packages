{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-09-25";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "f4fb559db391fec727423ff4a6edaf9b94cf43e1";
    sha256 = "0bq4w5y612k17qcb745m1xxcbng90aim703rbd9r264sl0kaixwx";
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
