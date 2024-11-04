{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-11-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "01a779004d465c5b5a0f3488815c9739dd8fcbfc";
    sha256 = "sha256-QKaomfphB6gE51218eFF1FIyLJnohuhAH0upjavxrU8=";
  };

  cargoHash = "sha256-gNuvfjl2aGvfmwiUbAtN4xwtH0w7kNTXpF5RaG3Rpsg=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
