{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-09";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "8c988efa08e13370bcfe70a760733814dbe22fab";
    sha256 = "0mzfif0zsfkq36mhpm8lm7mi3bgqz2yc3jax8jcrk5km5y3p736h";
  };

  cargoHash = "sha256-ltzROXgIfhKUmcOemdyX0dF2XqL0db6Sx9wdqYIUm5I=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
