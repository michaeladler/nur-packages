{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2026-02-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "a1ec08870e42f4c76ee89c530fa530455eb1753a";
    sha256 = "sha256-EGT/QvQq/ZxU7EvNXP/+x7xIlqtZ7XKUB7sJUwI9hgE=";
  };

  cargoHash = "sha256-K0cjjMg2a+S8PbH70fboVF41XPFjSSPc2HlyLjNxqe0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
