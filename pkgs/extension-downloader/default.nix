{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-01-13";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "e1f7341e72d2c692cf40488cd5318001399fa2f9";
    sha256 = "sha256-9DKEyE7/DdIk1ydC6ror/gg3kjAHTKMA/Ep+MAWRivo=";
  };

  cargoHash = "sha256-cxmXrhambeVgWKj4V5iRgCEeetsRqtXdSjOdrwljrtA=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
