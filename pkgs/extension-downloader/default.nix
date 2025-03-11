{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-03-10";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "ab3fc6faeb014b2551050fdcb529695f4b8844c6";
    sha256 = "sha256-WvUri81PcOXVApfKn4O9o/+rI3JasPQwOQl5SyZDZ+w=";
  };

  cargoHash = "sha256-YBFRJInvbPZEuiUtvbDTSCAxp2sLFmC4lpbV7RcmRbw=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
