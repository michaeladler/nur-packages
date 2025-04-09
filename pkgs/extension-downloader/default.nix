{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-04-07";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "9f631bc478782eff655f6e6af427fb37411565ec";
    sha256 = "sha256-5WFClOfsD2S7gliPU+XKKOujgbh37qCXFPQ8DiaarRM=";
  };

  cargoHash = "sha256-J8bMyo7vpZM/PCiNb+MSgQuht9CcqDe0IIoQYyB9Rus=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
