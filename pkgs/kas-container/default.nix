{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-02-27";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "258acbead6fc07e7b6f29fc1c7bc0a355d5047b4";
    sha256 = "0zm0r89xzq8mnmpmp8xr2y887jbg0wq04f529cw54f4j4q4hcdks";
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
