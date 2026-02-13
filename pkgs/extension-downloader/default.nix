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
  version = "0.2.0-unstable-2026-02-12";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "982d002a65f0069e6e979c52751856034e7300eb";
    sha256 = "sha256-iNhwi4ywNLZowYcudoaBGQJBA1pU3kLfDrYj8I/60j8=";
  };

  cargoHash = "sha256-MgNNJwx6pY2WkYhMYaYPI9ywtmgBDIyg8qFMmn2ftMw=";

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
