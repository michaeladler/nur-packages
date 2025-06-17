{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-06-16";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "abcd58202370108d721b11a6164032971ed055ac";
    sha256 = "0rj2bq5w0p7lg5j3y9xmnzaqbiyif439hlvxr2xa4gfckm3b3qks";
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
