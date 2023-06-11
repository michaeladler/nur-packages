{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-06-09";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "c582cfb53ed7a8207a22a19cb98fe2232d4f73ee";
    sha256 = "0iwylzxyrdhizmy81fg8ymqp8vnlv9ylh2x376c1dgqyi6s2655y";
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
