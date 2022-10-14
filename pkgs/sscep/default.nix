{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2022-10-13";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "83e4eb5b52914e98d62da9149ad57f48bbb96dfd";
    sha256 = "08s8jdlsadsh5y3ni1wmpyw5yq6ksvi0cgzyrc3m4m7ysfd76lif";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
