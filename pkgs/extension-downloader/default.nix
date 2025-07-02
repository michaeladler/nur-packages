{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-07-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "d560501a670d9beb769146466085a3228dd1034f";
    sha256 = "sha256-LR6OWlqu4uVu5qCx7hFZX64fVD6XM+OuWjjp1T+h1+M=";
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
