{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-04-09";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "ef5f44901251bf20ebf222f988c56a611ffb468b";
    sha256 = "sha256-980z2UB60VkoQujX3YwpfbcVUIlXNNDCjaIM7zReXkw=";
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
