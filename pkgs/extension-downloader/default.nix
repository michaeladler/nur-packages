{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-11-04";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "76906689f12a43b5c45e99fe7f42d18ad4dd49a6";
    sha256 = "sha256-5k5CAnRN8uEi2NTST8rPuN/1L4e/ds4h+ktNbyZLbLs=";
  };

  cargoHash = "sha256-oRe+qppJ/DL/AhDnHsiLft/Lf36DMUwmUzHOxpnVchI=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
