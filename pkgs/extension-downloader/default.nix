{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2025-10-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "b1766afd7db8a799b0233a5fb0c44711065c4807";
    sha256 = "sha256-UHN32lEjrljJMZV2uOgVnxzRZsMRez50pDuOpp/xtms=";
  };

  cargoHash = "sha256-tl/cE0twhzii/8drey+FUfYdzLpOuZl+NjePAIXKY0Y=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
