{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-03-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "5ebc4ce7bd4ac28db9f8cff90ac91d1a6d80d52a";
    sha256 = "sha256-bvSKpz13QmAiBxkFBklhC2L4FRCDNSmpPa6xxCMngfY=";
  };

  cargoHash = "sha256-lZG6Tw6uPqi2NL74Wep4w4jnDwzsiwrKtlJXH9idzQQ=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
