{ lib, rustPlatform, fetchFromGitHub, pkg-config, openssl }:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2021-11-30";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "c468277d54c7fe0d79da25a9266d8c27fd7d959f";
    sha256 = "1kyapf0dshkl4prl15xw0v6lkpk6kxwpqpwlqbv1xm93k1zwk7xm";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  cargoSha256 = "sha256-axx89KPr3SJPx0ZIQu8aNsNha97pPkfhd4g40p3cOZE=";

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
