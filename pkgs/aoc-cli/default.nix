{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-25";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "0b4e9723a85264e091e0ef9b77ec475fbe4ad2d7";
    sha256 = "0bzncwsmkr50xykhn4qgrv91yph5mvhgwx03mxxgh8kdmd3jhb1i";
  };

  cargoHash = "sha256-LhMwyVKERMeup7g1jRumsymxpAp+SiUSFvEYLlZI6hU=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
