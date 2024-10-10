{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-10-02";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "80636528e6d5b9bfd78a4d70eeb2fa6a56fcc6c8";
    sha256 = "0nn2r42cahiyncizy1rmvaq3rwsbhn7q0hlcjzj5vsrl9c24j7in";
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
