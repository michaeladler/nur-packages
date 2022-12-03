{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-02";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "57b9e37920ad411b47db471a26a795f78b593cc9";
    sha256 = "0smrmdqf6kk9iqd3dsffqyd0hvh2y6cx8jglsc7289p6y3zxcdk8";
  };

  cargoHash = "sha256-PTgaFVyb+lj9xRU2yNoAIW57EfWt2Wd4lV6Xl/4vQuQ=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
