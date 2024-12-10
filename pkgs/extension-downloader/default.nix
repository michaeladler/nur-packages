{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-12-10";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "73bdff1490c9f51deeda7d86b674f713b644aee6";
    sha256 = "sha256-Baj6PWOyfTyglVmKc7Jw97lqoT/MbR+FUi43cHgggPE=";
  };

  cargoHash = "sha256-Ci1ALnqXQfmtL9S9LAk5BUTGExV1KHWpPSVUpWuQlKw=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
