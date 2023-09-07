{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-08-31";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "4edb347c920467f031f9ec2ddeda23db641a38bd";
    sha256 = "13f6agaslk5wz5wflh6db1lxqxlky9pw6z84qddx4n2nbb7k6y6m";
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
