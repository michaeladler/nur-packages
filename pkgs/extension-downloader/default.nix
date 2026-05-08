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
  version = "0-unstable-2026-05-07";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "e7f327b572370dab9e0d3a786a6199d5c63138e1";
    sha256 = "sha256-QAazylXoyh3GMV2c1vOGh3cGcmR66f7HuGRU/eY993E=";
  };

  cargoHash = "sha256-wG8G1uNlAfu9LwO77KtJ8VAaQiOJtMhMQvAy9VBudWU=";

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
