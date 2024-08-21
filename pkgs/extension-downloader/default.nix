{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-08-20";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "473b4c6355822f7ccfa0dea4c428ee7dd4f18b02";
    sha256 = "0xn9s98q7p95cgy4a1gnbw2dx5dqvw516049x0xk24ychcz9snb1";
  };

  cargoHash = "sha256-pPNdJrKRGB9OsATUmHcEk+1an7/qoDJFlkyraPPrsQI=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
