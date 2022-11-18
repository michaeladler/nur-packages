{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-17";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "38a15b4096af9bb86bdeb031d7602e68635e5b83";
    sha256 = "0df5k7kx62rw122vid2ab7i0a4y1qg6z49kfp4d7gmax93mpvcsv";
  };

  cargoHash = "sha256-/EauI6Hu7L4voYzSdX7Wqrk/09RXKPI29RloBVQDXXg=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
