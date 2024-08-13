{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-07-19";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "5df6e79546f184ee9f38ce55f39afc14c1d27767";
    sha256 = "1zc7i0vgnqpb62j5irz6rxcnvhbgnjxsbc6yy9x9ibd1bn4lxdgf";
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
