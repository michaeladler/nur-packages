{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-09-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "fa3106f7363f668b2e2926478e770b9daeb0b162";
    sha256 = "sha256-bk3WnIB8Ns85LLEfe5/LCZm3kBMOueWvIR6Kp+qlRaU=";
  };

  cargoHash = "sha256-+Vdqu92UqCPAXhZEB+QS/ClLCXP36mFGwE45pvGvafM=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
