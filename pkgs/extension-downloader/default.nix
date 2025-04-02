{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-04-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "84a7bdf3ef5b9face73f98670a3f1978c43eb9ca";
    sha256 = "sha256-x+69zm46YdLjIYDqb2fw5Qam61cCodbP8kmMAppFBf8=";
  };

  cargoHash = "sha256-n9oJVxucxafoI+m69mVO+qUwe2ITxhgfJSj7ryImxMI=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
