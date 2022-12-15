{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-14";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "1823498f3d81da0290264c0d08a133fa8458bc38";
    sha256 = "00y7aa4c8c8j37xb2b3k9yjq72amygs63538njlciafpidic5xxm";
  };

  cargoHash = "sha256-BWtUgdQM+g/58Bw0BztoY34678HcsDqlFTRHEyixm8Y=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
