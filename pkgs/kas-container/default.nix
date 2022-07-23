{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-07-12";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "682db509160acc71ab902d5284b82d04768ea443";
    sha256 = "1bnb7rrgjlavg22axj00wcdanqa9cp181jnadrpmv99wp0iyrlk1";
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
