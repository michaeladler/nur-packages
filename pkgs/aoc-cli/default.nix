{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "aoc-cli";
  version = "unstable-2022-12-19";

  src = fetchFromGitHub {
    owner = "scarvalhojr";
    repo = "aoc-cli";
    rev = "15e106e279071bf1bbd829f8ac697527e3b2a713";
    sha256 = "1l71i0baypaskdfyw30nfna8ljija19xdmracf5lr985qfjkyzss";
  };

  cargoHash = "sha256-d9JVrkyyUMLnKFrCiMHVuV5vXuSF29iD9Tk9OYDdo38=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Advent of Code command-line helper tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };
}
