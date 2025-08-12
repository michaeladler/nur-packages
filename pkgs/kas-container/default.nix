{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-08-11";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "7ecc070d52c16c5aa20101b33da6e69b6f0738eb";
    sha256 = "052hzkysykrzc2kcn59q9v4d4nvqav1cfwhrbzd9d2jacs4wcdwq";
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
