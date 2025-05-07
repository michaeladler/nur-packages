{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-05-06";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "d7f08386ea4d6fc82b93c2358a619cbf8fcaff13";
    sha256 = "sha256-o+OM3D1z1IFWZDqoIZ+x8UHENHAniO9Cp5SfvTHl4A0=";
  };

  cargoHash = "sha256-sEKRwPm3z76omAXgx3sm5GzXSzXbVNnsmrg3swKGsls=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
