{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-16";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "cc7ee4ab6e574b3da6a389a84290677f60924fb1";
    sha256 = "11sndg9g2s14fa4sa42clfpb5agz1l37hksmn1sh9l7vf8gv5w2a";
  };

  cargoHash = "sha256-1bijB3vWFl33GqDzCDorqAog8GO5xNhwOI17go21+E8=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
