{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-08-26";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "aafc745cb2555582e8e8afd5160cdfd8738f2160";
    sha256 = "1n8zrfcgdbllxlnch2xnjm1v63hcs3g4zbnwkjf9yyv5plcayl8z";
  };

  cargoHash = "sha256-mAb6GHKgF3ituP92xc0eX5ipABZ6AY7ZWf2qQYfNx68=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
