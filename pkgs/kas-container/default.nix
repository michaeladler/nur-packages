{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-03-05";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "b9abbd1e63298e1f4956877ae0e07d64685a8819";
    sha256 = "1ix8i4pxslrqs1vdws59wvbckzb5kh6piv18micr0bi4k0phn70d";
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
