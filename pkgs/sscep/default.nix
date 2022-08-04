{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2022-08-04";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "c33ba37cc472fa5c74a03a6a2898f4427e71dd17";
    sha256 = "1wdzvqgw40895g5m1pmnmb00fs7x47ra4n3lxwvqwx9pkp4jnrip";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
