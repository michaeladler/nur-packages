{ stdenv, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "sscep";
  version = "2021-02-08";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "871625def105a7cfc0e7a8fc183cbfcc8716b660";
    sha256 = "10r43yyapyf8as9mj76vxcg7a16hvsh73sp00yv5qvp89g9bvq07";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = "OpenSSL";
  };
}
