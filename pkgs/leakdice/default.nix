{ stdenv, lib, fetchFromGitHub  }:

stdenv.mkDerivation rec {
  pname = "leakdice";
  version = "unstable-2019-04-16";

  src = fetchFromGitHub {
    owner = "tialaramex";
    repo = "leakdice";
    rev = "357897f1701119154ade5f1d420af802d80654bf";
    sha256 = "19cn7s3yv4g7cyl67j30nj62s0z2bhxbaq2mx34nvxsw976z3kwa";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp leakdice $out/bin/
    chmod 0755 $out/bin/*
  '';

  meta = with lib; {
    homepage = "https://github.com/tialaramex/leakdice";
    description = "Monte Carlo leak diagnostic for Linux binaries";
    platforms = platforms.linux;
    license = licenses.gpl2Plus;
  };

}
