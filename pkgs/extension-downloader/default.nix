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
  version = "0.2.0-unstable-2026-02-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "89b8911e27b2232c4eb1469603998ab5753dd32e";
    sha256 = "sha256-79CKAO1nRaB6jRF5HDVpDjbL3a/GDnf2pJpotWDlCRo=";
  };

  cargoHash = "sha256-gfHIl2Hoa4Jao64pZ5cOQUl5ulUOUipNjMXfYYIPZFo=";

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
