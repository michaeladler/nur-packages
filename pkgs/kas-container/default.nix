{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-10-26";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "66261547b75885786777a0b9c8a4400ab81d432e";
    sha256 = "0s8g5a7f0i67qprpf9799a6fh93i1dyzac4gl25g9vavirbzv30i";
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
