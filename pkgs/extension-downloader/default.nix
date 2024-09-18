{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-09-17";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "432c0739400e83acd6ac44fc2a6eff07f91a17ad";
    sha256 = "0jiw146z7hhglqmc4v7j02wfqv03q9s09l234n947q9lyqymqs4p";
  };

  cargoHash = "sha256-QwmfymjwrpaGXmObRCFyDir6hyecpz6ntR6gnJzWC4U=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
