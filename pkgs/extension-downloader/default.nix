{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-08-13";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "40da0863c5cb8f4e3017467148e227ef3e834cbe";
    sha256 = "0nwydbjgd9z62gq5jgpwl0j8x0i08c6hhgnain1m7vs2iqii4xcw";
  };

  cargoHash = "sha256-zelPhspV3nFIaoPNcDfm9COlgE6BO6/ZsmDCBPNCGUo=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
