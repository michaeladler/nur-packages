{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2021-11-20";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "30f1c48cf7af7923dd12d36a9aba1fea1d55b45d";
    sha256 = "0ai7xlllia0h2rigiabd6mfan1x4lg1fr32pmck54ai9zr4g6yxl";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
