{ stdenv, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2021-08-08";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "b281fb6463cc9980de5bd81da8628d40c26eef5a";
    sha256 = "1lvgqv7z2622wld6amy0xa4si48137nr9vf8d2s69lh7rgfx31i1";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = "OpenSSL";
  };
}
