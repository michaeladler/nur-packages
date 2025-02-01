{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-01-30";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "18c940d98f51473abc65f6fc91213a71d44bce2c";
    sha256 = "0yd5pbnb5wb9m1hpjys6rm87250pdp7w92kjg4hw98ycm3a2l2fb";
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
