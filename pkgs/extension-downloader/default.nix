{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
  cacert,
}:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2026-02-23";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "27b3acd49ac709a6372ac995ac8f2e1f45273e23";
    sha256 = "sha256-am8RzmAXIxKAYaE2zrt0CJ8y3/d1VVtPqcDDB+YHFXY=";
  };

  cargoHash = "sha256-S9xFf6zuNO1w8cQC3t4LEmP4e1hNmjHEZSqt5QHIvnE=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  checkInputs = [ cacert ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
