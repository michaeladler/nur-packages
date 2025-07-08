{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-07-07";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "4dfc1b7c2bf16f68ccc0801f94f21c5edbce82c7";
    sha256 = "sha256-MQ4C8BTF6Ws/abxgTdugJcv99BYq3cWgJ5Yo0x1pBts=";
  };

  cargoHash = "sha256-jx36gfKvK+xpfq7+xQjb7vN8i+Ajeubwq6kUD1iJ0eU=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
