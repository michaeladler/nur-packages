{ stdenv, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2021-07-31";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "bc6621b363145a00e71fbfa80a15f91f6a56da89";
    sha256 = "0yr2qp5k53zrcfnm2xgfrg2vlzxdkp01ib7mf1lrxnpzgznfgw20";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = "OpenSSL";
  };
}
