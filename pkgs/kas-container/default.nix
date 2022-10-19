{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-10-14";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "c0d00aa6372eea131be188fbe607f96b8ae9a2d7";
    sha256 = "0sc6wn333fr1krrmjv9jmikpjzvy35isypy97sjc6zf9014zv2pn";
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
