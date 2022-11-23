{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-22";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "564babbe83ccb3d5c0037e3a1d7190d25d12adb1";
    sha256 = "02n92q9jll4nbxz2zk7c6h77vsdaaigv45b43nwy62g50vsz63aq";
  };

  cargoHash = "sha256-TkJVbXkEbCXSz0AJE4VisfaGy7bkWYXE4aCzNwrkdkM=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
