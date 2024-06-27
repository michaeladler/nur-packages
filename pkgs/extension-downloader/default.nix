{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-06-26";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "92caff9d5e794d80fb4d5a6c490bcfc482c6bda2";
    sha256 = "1798259h1alnp1vzkp9m3bvwg5lixd56ff00qc04vqa6f09iwwxc";
  };

  cargoHash = "sha256-pkQJJ5PnQb3do0IXCPAtslapVApKXLl07q3qeKN8lck=";

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
