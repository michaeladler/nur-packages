{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2026-01-07";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "a0759e14e997d786af7dfc63bb47b76fffc87455";
    sha256 = "sha256-TrozDUz04N+hWqu3yPkz4db69yIGcsiNnmXXa5iDjOQ=";
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
