{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-09-10";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "852f5f764a332cdbac71e6928578fec24349c4c4";
    sha256 = "065s70cqhbi3s12gxwqc8n1mc0isv2an69cf1sl61732mlqgrjyx";
  };

  cargoHash = "sha256-Q+8Efn66PVhCUNKIn3Kel1ykYpgTEuumwq8rWZwyy5k=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
