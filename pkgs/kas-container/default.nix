{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-11-20";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "af6e1f48db685cd231e3d540f2a80fcd39992b0f";
    sha256 = "1ynb0grbxhcjb708mp92a84sdkv915a8fl6xk1gsmignn6grhml4";
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
