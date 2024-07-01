{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-07-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "57fffa58103b7603aa4a9a6fae8ceb1380662b3c";
    sha256 = "07hz353syp254nrpzqhiga37lss71sw2i4zz03w8zhkslzbbvjnn";
  };

  cargoHash = "sha256-O7tkHVxtPkJL4EihxqUTTBV3P+lbP3JwpL1JDEj5cJw=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
