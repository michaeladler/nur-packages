{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "aocf";
  version = "unstable-2022-12-20";

  src = fetchFromGitHub {
    owner = "nuxeh";
    repo = "aocf";
    rev = "d3773876bd13b01a64b1fbba67d35e455158d47d";
    sha256 = "12g69ycaawa327adwmsv400l9wfqcrs3gqsmi9afrih9ppj158dw";
  };

  cargoHash = "sha256-9+r3ovcwAuAliggiyOWLIoeZR5YTzeRSQfHy+nLniE0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ];

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    cp ${./Cargo.lock} Cargo.lock
  '';


  meta = with lib; {
    description = "A CLI tool (and also crate) for Advent of Code";
    homepage = "https://github.com/nuxeh/aocf";
    license = licenses.isc;
  };
}
