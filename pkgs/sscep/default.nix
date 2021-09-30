{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2021-09-29";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "b3f9798d56d0f6474b491204ff426d80fd4010a7";
    sha256 = "0q25z4s5sq97yrpv54wsrxr3vz9cd31ci04ffj6znb42scw50p62";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
