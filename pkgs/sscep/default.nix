{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2024-06-08";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "0c8f1962357287ac4256d756358395938220bdbd";
    sha256 = "1gl41i2akw0r8aqnlvjsc9gfbpqw0y9w5w7kn0dhwyq9s4pkxvja";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
