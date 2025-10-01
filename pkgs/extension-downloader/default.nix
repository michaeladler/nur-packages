{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-10-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "d7bd4845d291919761eb1e083bfcacca2a61124a";
    sha256 = "sha256-JOwymIbCGpYY0dqtufx9g2Gq0Meib0Zg2O51E5rx8iM=";
  };

  cargoHash = "sha256-+Vdqu92UqCPAXhZEB+QS/ClLCXP36mFGwE45pvGvafM=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
