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
  version = "0.2.0-unstable-2026-09-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "d39e2a221025c699d54b1355374f72399bd4c818";
    sha256 = "sha256-a4qUkZbg82w2x17u7usJxClJzY88Tkulk7VQvADIH/0=";
  };

  cargoHash = "sha256-UCfNbet5DHOhgYyCtaCirs6bTBYSiSKheZ2eN1vJ1Qo=";

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
