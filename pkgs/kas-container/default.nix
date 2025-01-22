{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-01-16";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "fc7ddb1b053cab2534fcb845c9496343b2cf908c";
    sha256 = "1nka4ng096rr1ixamv8sas4sziq34x90i523li55qiazxb4w8psz";
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
