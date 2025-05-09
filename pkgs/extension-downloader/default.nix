{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-05-08";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "d2ef776becdb6597ed181948a059493ec66c30c2";
    sha256 = "sha256-PXemwDUdGrZZz2xr+CKDls5PHxbM13cqv16tI5CQXe4=";
  };

  cargoHash = "sha256-sr2H5UMphl0aosGHaCS3vfshSi8zBcG+HvrtaeUyX48=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
