{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-06-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "2c1cde3f0ae47df3d2d482c0bd2b452fbc462cd4";
    sha256 = "sha256-qU64gcWV4h5w1ekQZgQFZ1DeSIgSqxhv22GFv6g0orE=";
  };

  cargoHash = "sha256-dgR7Li2ryFKspjfCU9xhC2i0q0Q6pMyG33mtA9Vw4bI=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
