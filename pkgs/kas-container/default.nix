{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-10-17";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "e9ca3d28b547dcfc1f75b9479d17e6b92ae47b41";
    sha256 = "0x3z5kgvnh08rav80q2dvfwqdxqc9zr606bnlfyy7jlq2d08na99";
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
