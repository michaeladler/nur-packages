{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-05";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "f3eb643c6bb467c815208dfd9c08987c205243ad";
    sha256 = "0yjdryamcnzmzzy5h4rw9sf0ixgmrsymzbicz0mh08c4rkxl39kn";
  };

  cargoHash = "sha256-cwfK5HxuZYotXCUkgGMpiDiuFrjyj5pQIVt70OFk6MY=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
