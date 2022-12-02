{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-01";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "7bef073c0c0206849fa8be6faf6515c57805e2a0";
    sha256 = "099i0bij374a9f7l8k5fmrbqllcpfw3n0ksx45kg9bwma3jqjnvj";
  };

  cargoHash = "sha256-DKkPNqxxDO4xrRrLW3GyEDCCbtS+/EAAZsFx2ILjwR8=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
