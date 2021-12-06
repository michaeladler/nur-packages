{ lib
, fetchFromGitHub
, naersk-lib
, pkg-config
, openssl
}:

naersk-lib.buildPackage rec {
  pname = "aoc-cli";
  version = "unstable-2021-12-01";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "9022d5dd0765587672dce80b49c37da42af51c6a";
    sha256 = "10qb4mvkdmp1npsj7lykz0dhbqdy6577aj3x1nrbzf2l9if2a0ch";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
