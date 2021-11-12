{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2021-11-12";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "691a926d0b536857e672e1bdb5fe0c45a2f7390d";
    sha256 = "1xa3pkfbjvrgk3g2v1p4v6wqscblfc1hzaf9k8cs3hldbslxbk8x";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
