{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-09-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "44dbe6ddb300e9554f42def4601e38af5adcb044";
    sha256 = "19wkrwayvi34sybhp79p408p01r1r71ky7s3wp61hdpppabr86da";
  };

  cargoHash = "sha256-tmkbokafCHsVxp7w17JmSiHAHtOpv/1OvkAUI5p0pNc=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
