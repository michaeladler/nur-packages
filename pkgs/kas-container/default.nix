{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-05-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "d2ecff42439fabfad662b309e6f33905dc1895d8";
    sha256 = "1799qvxdzv9vcgprdkpl60k9135wi91p4j1k6bbafggcxc678a28";
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
