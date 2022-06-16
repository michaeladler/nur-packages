{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2022-06-15";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "1884f241719cab7b08fda560ea99cce5703c681b";
    sha256 = "1bk261vlm57bjp5jhrizs3zmcvh4g3dxjm170rs9087xpf6737pa";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
