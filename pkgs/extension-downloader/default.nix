{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-07-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "5d0ad970ad3aeeb9fd8103c883696d31dadd3e9e";
    sha256 = "13hxasd3q8c4pzqs6z8gvamhlcqbw0m03vln6lh13wcbmzmx8qqi";
  };

  cargoHash = "sha256-CWTxGqkLEhHCL2tCj3O/0Do4l4+2dcJpc6xiNVTbiLY=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
