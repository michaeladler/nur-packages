{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-10-08";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "8eb15a0ddbaf5877565a437023c0bc52eff3376b";
    sha256 = "sha256-FyMB7uWdMCT5iWsNOWIKQOaMM6S6nYgjgVMcrX6oh9Y=";
  };

  cargoHash = "sha256-byej80X5ZE9cRwJYYC+m5e4/FqtrkYU0RtYw6RO4HD0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
