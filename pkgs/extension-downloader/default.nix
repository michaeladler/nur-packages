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
  version = "0.2.0-unstable-2026-02-16";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "5ec5c161e7f8bc60dfecc8e61e866ec0d0543d69";
    sha256 = "sha256-fBm682vzpPmky3j99DvOHbUJzGfwHO6iRPQFK5HaawM=";
  };

  cargoHash = "sha256-XaQ2JhS2Jx9RHC1uU9KvLYrRMpn22mQ5cC9g2v/C5Ms=";

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
