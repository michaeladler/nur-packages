{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-09-30";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "12add6c6ec92554a7e77623a6a07be5899a71460";
    sha256 = "1jhhxpaacwaqs0bksrcavx4w7vpbnp2fjf00748gzfdipb0ra0ir";
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
