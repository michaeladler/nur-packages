{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-05-16";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "64e1daf76b0ea31a9e1de5f2e5c99661ae570889";
    sha256 = "1w9bxcs9vs8650sbaf1w9rkac972kiis593kjm6zhg86mlx8sgq3";
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
