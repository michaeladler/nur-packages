{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-08-31";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "0d6e6037daa38db329fb43591d0825cd8e99610f";
    sha256 = "sha256-UIFKTPLDHH+PNU8QsRmTA8ihzP8s3hys7IJFgp8D8sE=";
  };

  cargoHash = "sha256-+Vdqu92UqCPAXhZEB+QS/ClLCXP36mFGwE45pvGvafM=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
