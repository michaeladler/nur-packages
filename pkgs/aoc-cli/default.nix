{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-11";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "1b627fb51dc1f04c5c183adc9e09e343cb5d34ca";
    sha256 = "13r7yg0h6wg5xrdb69gc90nqh4fxbfxs8rcs9pzvmbyis8qnk0na";
  };

  cargoHash = "sha256-duWWJf7BmDgmHC2Eye7sFxevLmm+UUYkq8O1cZdJFwE=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
