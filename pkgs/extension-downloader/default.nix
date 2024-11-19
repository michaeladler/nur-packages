{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-11-18";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "d4f504111c0e8b172fd05811f638032e749bc773";
    sha256 = "sha256-lcgs3SSEDC/nZrjR3ZvBtlbHhqoKPGSyVMeoZe+hPug=";
  };

  cargoHash = "sha256-sny0GTgF5P6lnHrCFBxbGYz+V01PraMbEHvzVRuNG5E=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
