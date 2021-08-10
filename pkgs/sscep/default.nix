{ stdenv, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2021-08-10";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "0d408cfbc29c09e0abd4d0fa0bd846eabde73c41";
    sha256 = "1xq6ylcfypxlkm94xiwzpqjn8r5pz8h81jqszs7imppi3cyfl4j3";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = "OpenSSL";
  };
}
