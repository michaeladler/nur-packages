{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
  cacert,
}:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2026-05-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "485af268a0e0d41f19f1c48999667c6a9dcc0a28";
    sha256 = "sha256-2u3J5DzsJjyMy9wSRCdsWTN7K6pecOAkE2RafgXusAM=";
  };

  cargoHash = "sha256-/piK6TJRsTPknC3ZNYZ9Rx5HwH0baDxzlk4aFIrP1GI=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  checkInputs = [ cacert ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
