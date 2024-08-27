{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-08-27";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "7134e11fb126c91e032bed5fc680760590d434d4";
    sha256 = "14xyw5znwhqnd69i9rq6wzslkr1dsjzf028fw2x5f6x5256ad00d";
  };

  cargoHash = "sha256-VhQA1/U35br0DfzgVyyTK7A7ufhWDoqOOhA3LCQnqOg=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
