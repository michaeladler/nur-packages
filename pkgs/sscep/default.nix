{ stdenv, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "sscep";
  version = "2021-07-11";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "171911484c4f549f1328baf8c5a417e206ee120d";
    sha256 = "0hw8ggvz2jq9hfcm2xjy45l7lld4p7b25mnz4nvzv0vdai5swjfz";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = "OpenSSL";
  };
}
