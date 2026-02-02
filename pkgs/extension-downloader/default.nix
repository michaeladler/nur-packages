{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2026-02-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "3f90472a97e737f27abb4b1d80e8ac4889682422";
    sha256 = "sha256-X5ArwnrIWLNw+CIZ6DYJytTeciZFkO0pxcamQF2kCMs=";
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
