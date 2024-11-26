{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-11-25";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "4632977146a237eb5793d3b6e36c81cc920fb0d2";
    sha256 = "sha256-eVGnUqq5OhJ86cePdtdmWyv+p3oNc1xczchQb7MQjeM=";
  };

  cargoHash = "sha256-r6amu8ed0jAOkrF8nvbXak8c4wMANOGxwaJBZoy/MYE=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
