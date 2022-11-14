{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-13";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "c32790c53373e7f4abfe0ab495c2e21e9c9d581a";
    sha256 = "11sndg9g2s14fa4sa42clfpb5agz1l37hksmn1sh9l7vf8gv5w2a";
  };

  cargoHash = "sha256-N0IALUNMzGRItwhyl2I1sylEgQ6nXYijUg6ktI+AeKs=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
