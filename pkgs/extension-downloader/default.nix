{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
  cacert,
}:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2026-03-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "9ba05e15498816306cb0d707206623f872273955";
    sha256 = "sha256-9qXoRWbUrO3hWraHtMcGr2sA8vzRY7mRicNoKBnraBU=";
  };

  cargoHash = "sha256-tzkLjiDsAsgmkhIRNu+ZEJWx6fER8P04AuhEWPuw6w8=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  checkInputs = [ cacert ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
