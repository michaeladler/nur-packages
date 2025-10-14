{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-10-02";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "b8697b6b6a23925d46aaccc41c9453b93d2510d0";
    sha256 = "0d6wc1ywawi6ddsxk0wisbr8ldwrvk87mjvhnlcxc1ryzl5ia92l";
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
