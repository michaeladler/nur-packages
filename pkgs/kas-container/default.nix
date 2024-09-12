{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-09-06";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "ffa795c3458e8a074c5f7e0378095d4d01e42aa2";
    sha256 = "0wh7fj22bh5nd5q3kysf5yj8pwvrri6s7y9372ayipas1vbmrw10";
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
