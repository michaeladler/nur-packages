{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2022-12-11";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "65561b53344b834877e6b63320066a1e26038a3c";
    sha256 = "1jgp14llxlda8xai94pzq80r4wzd28zpykgv9zy881kh3jvfqkfm";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
