{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-09-25";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "ffe7ce570d0e4b0c4ac3a1f0bf4383a785c0d5aa";
    sha256 = "0xqjgpq2zvll7ssi2ah11ni985whbc1sq5b25fnci6hq3blsw0aw";
  };

  cargoHash = "sha256-eJkLrIpkNRStRDqQDQueZvLSRalDffEK3XP7fvrb63Q=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
