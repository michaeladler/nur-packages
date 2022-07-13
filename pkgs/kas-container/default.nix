{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-06-23";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "71cf5dc17bbfacc643500354891b95690e983dce";
    sha256 = "1f5a9rq45967vz0z5964hcqki0d7qyf2ia2z431yxwx9k7bvlvfg";
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
