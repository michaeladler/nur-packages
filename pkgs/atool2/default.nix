{ lib, stdenv, fetchFromGitHub, perl, autoreconfHook }:

stdenv.mkDerivation rec {
  pname = "atool2";
  version = "unstable-2023-07-05";

  src = fetchFromGitHub {
    owner = "solsticedhiver";
    repo = "atool2";
    rev = "1db9e4679600a1d1ed65cf4920aa010923345eaf";
    sha256 = "1avawl8cvgi41ac9c2xk1b53fp69rdzcg5h8j6p3m6bf6f1i8f01";
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
