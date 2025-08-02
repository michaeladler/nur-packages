{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-08-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "2b82bf90ed46e9f890bf2c0053586a2eec45feb3";
    sha256 = "sha256-T5rFAaBcPSdAE0+mt4/B7xd2xrri/vIBAKJ7bWpp988=";
  };

  cargoHash = "sha256-rHPzqM8mtF0d6J7tyOC1l5ca4EYhXLmcHnvU1YH1QlQ=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
