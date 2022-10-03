{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-09-19";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "26a7ab8f4887dd227ccd2ba3be49faa35ab72559";
    sha256 = "1zvl7qg1gbbmprwf77kgspxgl69x56b0n0iw643hjh217vg060pa";
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
