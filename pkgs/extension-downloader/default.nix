{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-07-23";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "f683f7516d73d4be37c2502901a4f2ffd1bacc96";
    sha256 = "0hqgfchx0wcr8a197xrvcz9ni3hdgmr878vinyvg38jvpxzd5yjs";
  };

  cargoHash = "sha256-oDBPeuVVcEUPNa94/DWMrUfPI4/qJE3KhC+HU+Yi9Zk=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
