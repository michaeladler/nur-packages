{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-07-30";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "8d05c6111701b064b4ebfb02ebc460cf47551d92";
    sha256 = "10fd8sr2gisks03nzpc51i9392ijrnff8b3cxpn5v1903msvibxn";
  };

  cargoHash = "sha256-4IHCS3ab10fMP7PFqRiSgaj1PiXxk8EyDKvjTYQN5S0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
