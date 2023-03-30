{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2023-03-29";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "4ffa4d142ea56c6a0ebd57f53390463835030e2d";
    sha256 = "05lw0ybdq5ywl3zbn6w3kz6w72dnxqiqw4yggf7hmpbrf55ydb1x";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
