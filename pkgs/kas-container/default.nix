{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-04-09";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "ad5e2f7a5c3f733964170d0baf0caef4752c0d6a";
    sha256 = "0ygfb9g1mba7rgh40wv9bqcax1aaxzln5srrl3k4s1sfcc46qa0i";
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
