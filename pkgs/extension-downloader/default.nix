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
  version = "0.2.0-unstable-2026-08-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "32041728be74af95207ad6d777d3618512db2e62";
    sha256 = "sha256-098QxQC1hWsz24/Tps0WbZ3+0hJvY2/lZqAQxNXB7iE=";
  };

  cargoHash = "sha256-QUyuVScaP2vFXK8yByas1LOxggFyGUkA4UU24vHbMww=";

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
