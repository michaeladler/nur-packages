{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-02-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "38393b93b3748316852d9157b114cf68c04d53d6";
    sha256 = "sha256-NTS0x2EfWX11Mcr/aTEX/bF24PsfwlmDuYb0Y8oHb9A=";
  };

  cargoHash = "sha256-e4RoS1JQnlr0hBoaDKozqFFaZ17FKwEcVnpJE1RZ5bU=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
