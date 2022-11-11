{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-10";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "7861bc3741cc365b7e2dada5c0ddd4b11aef4767";
    sha256 = "15v2zbpsj785xyapml0kc3vpdsaaj9m0kac9zv5m7fys54w847yq";
  };

  cargoHash = "sha256-FpW1SOXz8lmXj93h+CxtB3gnyym29HN4ImNhUAJ5jAk=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
