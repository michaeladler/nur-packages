{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-02-11";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "d89489ebe23ecda05488d47191cf951ea265cb50";
    sha256 = "sha256-2iN27bkpArHOsCYEd/YCKyljnI0HqCSyNns1o45Frdw=";
  };

  cargoHash = "sha256-ad/cDyV5dAS68mDvlJr2wuPl60lKT0B8ZwMOg0MT9HQ=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
