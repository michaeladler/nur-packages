{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2022-04-27";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "23891c2a375e110375325b6f5b8e8ef0953f6615";
    sha256 = "1fwymzcqqlhmwmf684m36dahdz06xqmaa75m5fw04gswmghg55mj";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
