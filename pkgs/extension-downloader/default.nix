{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-03-18";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "8746ee833a89bc1d9a0523a98168f9cb812174b1";
    sha256 = "sha256-8g1Y6YKtcILTFsl58D7Foe+nOJUMCNflZMtSe2HBjJc=";
  };

  cargoHash = "sha256-EQ7QQpGcvvzqjy2113uyq5Fj9XprV+bNmb+WJyxyn2Q=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
