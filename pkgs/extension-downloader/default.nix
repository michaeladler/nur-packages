{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2025-11-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "766d249242379c0d1ec04296c9dc5f6347330192";
    sha256 = "sha256-Y9pQHkUzaMRGivUIXrX+VFsBUon4N3cZsCN2TJRCaL0=";
  };

  cargoHash = "sha256-BQ0sOrF9RTHpNYp5R6f5b7vKVBdS4YMcbPQgS7equ5o=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
