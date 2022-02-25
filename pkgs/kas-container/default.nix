{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-02-22";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "3d35fe2f6035781034cb28d7719b772a1b25a8f8";
    sha256 = "1as3zhgl5f1l7h42vw205d9jjbsqdzkbyjmc3mx6bl18a9d6hxmx";
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
