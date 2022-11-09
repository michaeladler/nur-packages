{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-09";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "6a141959ebfa97ca1d5d773d17233235107fcfa6";
    sha256 = "07dwbq4863nxmaikksidrg4bg1rybx8ygicd51jhiash1j12fyvy";
  };

  cargoHash = "sha256-h0O2eM3do1seh1eRCgfdOz1Lw9tyrTtxjrPaCqLDAjA=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
