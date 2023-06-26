{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-06-23";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "044c7d0de72f1602566d12e8a555169c231e10bd";
    sha256 = "142xxfn8zq5c8mhp5qhjyijkr00ni48kgbbzff1k9l375hyk88h2";
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
