{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-02-07";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "8e37314f59f2907fb13442aa5c00771383873d34";
    sha256 = "sha256-NTS0x2EfWX11Mcr/aTEX/bF24PsfwlmDuYb0Y8oHb9A=";
  };

  cargoHash = "sha256-5JQPW+PODGg0c2KonZTfPpGP2GYq0Ls5MugLgwjyWFw=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
