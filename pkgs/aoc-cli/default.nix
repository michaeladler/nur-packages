{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-04";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "a0eb3f3fa006cc596bacf71fcb41e6a46ce7271a";
    sha256 = "0wfi2hbq44jv1izdr49ancfvcsvdldwly4ys59m0wm7rcmnwc91q";
  };

  cargoHash = "sha256-J5856HE01aS/zgffvfAd4AyMUL0a9zdrlOal9mE0a3Y=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
