{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2025-11-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "ebc09c564746a4fe33d87c1366d72fcbb8b9d989";
    sha256 = "sha256-ksb6YgiXVtJ8NQPt9mh5GEispsgbc/odB9FtUD3rVUg=";
  };

  cargoHash = "sha256-tkNwWv3lkFUVOcj/64Z96VNSEtRE+GZrGm9jlzZoaVw=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
