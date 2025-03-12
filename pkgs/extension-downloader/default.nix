{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-03-11";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "96db2f6f8afc868d8cbec8e01b41ae17845fa488";
    sha256 = "sha256-PPxumD+3BD5cYRW+IEmZ4XCsz7UjSQXuwwOW76KI8y0=";
  };

  cargoHash = "sha256-q1PA8fSvcX3v97DOAZ7rt+LZrAtKuLINUPAHpn90YCw=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
