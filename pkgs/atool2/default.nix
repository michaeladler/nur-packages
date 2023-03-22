{ lib, stdenv, fetchFromGitHub, perl, autoreconfHook }:

stdenv.mkDerivation rec {
  pname = "atool2";
  version = "unstable-2022-09-13";

  src = fetchFromGitHub {
    owner = "solsticedhiver";
    repo = "atool2";
    rev = "c135b880f063d0ba4d7d9f041e63cd9662ff5693";
    sha256 = "0fw3a1qvy0z6iidandrxhf18hki3b5ks6l31mzrs66883vx8gcww";
  };

  nativeBuildInputs = [ autoreconfHook ];
  buildInputs = [ perl ];
  #configureScript = "${bash}/bin/bash configure";

  meta = {
    homepage = "https://github.com/solsticedhiver/atool2";
    description = "atool with support for zstd";
    platforms = lib.platforms.unix;
    license = lib.licenses.gpl3;
  };
}
