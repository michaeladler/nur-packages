{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-01-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "751c8a1df0aebdcc8b1cdd2961b2b2ac5489b66e";
    sha256 = "sha256-zWV8bckzwnCI70DC+B5y1uz3fTctL1Ln0DfcIyPugS4=";
  };

  cargoHash = "sha256-83i/FlXlmmaq0qb28ogVA2P8Yqjdu8E2VNCZhbDvOFs=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
