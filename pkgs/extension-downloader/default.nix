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
  version = "0.2.0-unstable-2026-03-09";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "50ddeba0bbf1f2a065752b85adb0bd9dc731b654";
    sha256 = "sha256-K8Yj1zpmSvbcLAHFRv8oLiZg9QFjkG+8roytp7MAdNw=";
  };

  cargoHash = "sha256-7fmrjxLOZCH4lxZeBBJ423TMgLny4TDnHx1QCjP7qfQ=";

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
