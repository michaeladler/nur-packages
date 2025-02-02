{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-02-01";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "59e55e4f4e38d659e04de0018c9e5671a2a2fedb";
    sha256 = "1zzrzdjgyvqaw25nanr51ww70qdd635w2syr8n7f14mwnsa3fqiz";
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
