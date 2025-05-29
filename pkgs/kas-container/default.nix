{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2025-05-27";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "b6744655ba83f764b6d6d20a766e1a7a91f537f1";
    sha256 = "178i2h5xmmz7pc1nb6d0fcpayv5mz04cg7snfk6r5rcbvx02jkk9";
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
