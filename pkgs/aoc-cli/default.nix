{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-15";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "82ef97bc40fe94e90a94e9a0dd21f371730ca884";
    sha256 = "1cnbw6va5ifmwn9z0g0pxfsv6yv8xmr0lz0rl8rxpn46cqcnwhiq";
  };

  cargoHash = "sha256-l6ZHwLCyVdeKdMmQquMyoSU+0WBLosTCraSiHgFz5iA=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
