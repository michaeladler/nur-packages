{ lib, rustPlatform, fetchFromGitHub, pkg-config, openssl }:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2020-12-10";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "9e8b2c44e18f5493f224c04b58cd367936d8e40d";
    sha256 = "1p1qsck5k7hn2j8zqgnj154c3qjjibbgf8xks43ycbizisfdhlf8";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  cargoSha256 = "sha256-qZaGRgTaEGWja+YVh0woGmz+u+rB8+UtSiKs1FttlEQ=";

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
