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
    rev = "f546a416f766de3f3327e00e97fb051896133054";
    sha256 = "0fp0rxmfddx0n177whmajhvqlll2rhkdygcj0a6pskfw8fanslpp";
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
