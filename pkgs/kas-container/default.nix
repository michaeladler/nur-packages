{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-03-30";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "1b4efcb06f100ddf9bbdb628c059a77f5c3dc187";
    sha256 = "0fh6dbd90wavx55icp1dlia8ipqgdiphpkympr1rwmaskjy27gzp";
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
