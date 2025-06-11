{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-06-06";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "37836639578ae4701380fae1d2c4b9830eea30f5";
    sha256 = "0gb8fbbriqxdi047fqslg0zlqb9hx6ldcy8fb2jk4w59y35h9jj8";
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
