{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-11-10";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "cf76e4d69713f810c051fcca1c18cfd113eb5d69";
    sha256 = "1yybh404i1c74ixm602a4wxyaz94zanhzs3ldy671y71lp50qzgg";
  };

  cargoHash = "sha256-jUILT5kynH7KLCtJIPr24KWBzZqdp2KIvyGMjZ8rbDM=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
