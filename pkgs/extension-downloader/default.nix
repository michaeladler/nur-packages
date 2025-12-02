{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2025-12-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "1ebe4364d95eebd811c5e08e6b752e8e48855f97";
    sha256 = "sha256-YNNylHfmOE2yRtkxXZwtAqKj3e3qD56b3/c9bGomLCo=";
  };

  cargoHash = "sha256-XnDq/B2fA5Yo+aTFqGmFVACOht8Bu8cIJbIBPkhXluo=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
