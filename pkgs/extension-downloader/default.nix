{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-04-13";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "fbe744d14f52914a9ab58aa75993acf2be6321f0";
    sha256 = "sha256-5e4YwRPX6Ya7bB5tO2Yn9jF5QhFmt6qUlNKSET0iQOg=";
  };

  cargoHash = "sha256-r3your9Y7qsJEU4iitYF7/JsaifG6Sle+RbI9XszQd8=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
