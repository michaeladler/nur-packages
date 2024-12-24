{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-12-23";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "5ac20c78258d0bd9d27152462ee2b13600575a48";
    sha256 = "sha256-3Kmkh5eui7F/9YllURVe/La5asYp6OXQZs8coq1tmJo=";
  };

  cargoHash = "sha256-buIRtQKNdwjWkbj9vcbVVvQ+Fy8Ti4VYw77X1Hm0jYo=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
