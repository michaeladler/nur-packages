{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-11-19";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "90e42abc8094ffb6742cfe55d9eb736ea45b5d8c";
    sha256 = "sha256-jvL3OLBxe4+Zapoy0rNRJJvR/qRJLa19k0W8DKNq3cU=";
  };

  cargoHash = "sha256-opV0+3SKOSqqhZhZwuWP5dGzU5u922tLrsFQU3tbhkE=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
