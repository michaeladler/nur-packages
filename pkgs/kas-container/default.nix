{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-02-13";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "fd086971f66dd041f710192e3054e6e0c0718f38";
    sha256 = "0jk8z9zr6i762dzj6s709r5j4gp7rnidj3f8l6gsi5gmknsfnqsl";
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
