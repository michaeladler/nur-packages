{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-01-21";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "5d5b6dd4cfedabe968a5e1541f235dcf72c70554";
    sha256 = "sha256-aBoaBA8pc+zoEAgJ30zUkUHySSGlx0uNi/8BD91MhFE=";
  };

  cargoHash = "sha256-d6EFNLvuumM3E9NMoLKE/+BiP84sQyihKSb6C/XvAUQ=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
