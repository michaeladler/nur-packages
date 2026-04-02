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
  version = "0.2.0-unstable-2026-04-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "4c34fb9735ff83372f5b1b98b7e4c70cab8e726a";
    sha256 = "sha256-q7QaJLpTYBCsnEaioo+4MSuYcEbtF0AVM88LcDk0Fsk=";
  };

  cargoHash = "sha256-tUaxAXGyNOPI2zUG8Ns2hsyJ4v13fNlLG4o8ypIapLU=";

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
