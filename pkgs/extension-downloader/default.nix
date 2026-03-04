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
  version = "0.2.0-unstable-2026-03-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "55cc62ca8a4820ba251e048eb5ca084aa36da034";
    sha256 = "sha256-yqlycmUHe5MNbvfp+kaLDzMVxSshA19Xrmqz7boR+gQ=";
  };

  cargoHash = "sha256-a06JhiEmTTOsMX+6ShZNVibdjcZRvRgB5ymleHYebds=";

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
