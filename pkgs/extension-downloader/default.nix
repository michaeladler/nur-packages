{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-12-16";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "bee01429da66739046f31210df5aefe18d25fe6f";
    sha256 = "sha256-P3tgvfpSG8f28oRvbi2iW2Ag0h2dfTBSNozTX8WFdtg=";
  };

  cargoHash = "sha256-oLD+YqCNw7fplNaftgMSk1/deLthh384KpImk1C28zI=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
