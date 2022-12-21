{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-20";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "f3309d8c6cf428b4673b78b5746534557d4108f7";
    sha256 = "12drbbkzzjj049rz78h82b8vc80ws8185w5l441p5ixxzdcym1cn";
  };

  cargoHash = "sha256-9+r3ovcwAuAliggiyOWLIoeZR5YTzeRSQfHy+nLniE0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
