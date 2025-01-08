{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-01-07";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "a5b7cfcc105b38a7e95b2a290c966e168d1019b6";
    sha256 = "sha256-y7c537Ckgu6laqzSZvLRnIy/ahTwieYWOafBR3M6Ht0=";
  };

  cargoHash = "sha256-hYVzjEyBqV+GVKHEsm8wFz/p1Rg8avwcmDHO74LqWdU=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
