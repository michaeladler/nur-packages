{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-12-04";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "234bffdf446225b94b599c1246468db394e6347a";
    sha256 = "sha256-OWQ3cdwxhdBbaMhr8nFjoUHUqsi6Ek6iADpXeGUPjdQ=";
  };

  cargoHash = "sha256-9b/5fO2ryY3mbiVEEhwYOVafn+vzwnEI9zy5W+lpQqE=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
