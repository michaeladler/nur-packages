{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-05-07";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "236bdc89c89ae42b1f7c2be139143d84f3081f05";
    sha256 = "165w36kp9mxpah3cixcrv5a1ikgcr6wc4n3lamq1w8xivpy656yz";
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
