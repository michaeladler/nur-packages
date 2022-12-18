{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-17";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "a5b80a5ccaf772ef9e4d8bf301936723448257ff";
    sha256 = "0n3k4k3wgagpfh17mq5qmi8q54acs1wx297i1jld91b068jrb58f";
  };

  cargoHash = "sha256-JMUmOV7c0egF5DslVCVKr5h2UWPyJy1axP8lrdmdVAY=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
