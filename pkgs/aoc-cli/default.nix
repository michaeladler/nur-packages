{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-05";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "0285971a172d0048ed03a7f5825acd297e470376";
    sha256 = "1iw6ypr4ga53mgy80bscvn63mxqwg2ws4zskg4icn0nzf2ind6b5";
  };

  cargoHash = "sha256-jn399u43WmgeSiAg9HaYkNMHg8bjhGwQbzMuI8ItaWs=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
