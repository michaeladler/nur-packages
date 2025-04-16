{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-04-15";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "c6d3a8469b73a5882a0904045d78bd1ac830212c";
    sha256 = "sha256-DuPg7dZcOIeM0ceE5bL1m8n/v84xMzrmbZpdV65c2xI=";
  };

  cargoHash = "sha256-5zBnEFKAyN2s50BY+FIzL97/Y38Wa2iDyI5X0+/jELg=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
