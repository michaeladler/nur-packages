{ stdenv, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "sscep";
  version = "2021-06-20";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "a4316dcbd13daea47838f8a6d136c62c957806a8";
    sha256 = "0b4lb74bvi3sssjh5kzq6x37yhan2yqwfbw9na5yp4cngwd6gszy";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = "OpenSSL";
  };
}
