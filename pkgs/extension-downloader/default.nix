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
  version = "0.2.0-unstable-2026-04-23";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "7a017f692895bfa74d51c6b9691d3d42424d56da";
    sha256 = "sha256-FPESMk7iz5KzEzJ0LaSUPLbHpsXAYfDJWve4dCXKqeg=";
  };

  cargoHash = "sha256-CM8Hg4olvzZ7i6mEIlcAfHDoxJ4C9E7sHQlmijDtWJw=";

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
