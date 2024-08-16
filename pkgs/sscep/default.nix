{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2024-08-14";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "cb3e539818fdab46bf3812f44730d0999d3cc9b3";
    sha256 = "1zlx6v4zdx4d19zl7ikl68j8kwm01znqvvyj7s9zgayci80l4wbk";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
