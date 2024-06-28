{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-06-27";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "7e374530a1eefbe486b0753776aa940fd599b83e";
    sha256 = "112pjg5c6pd0hsi9pv8c0w5ki8xrdm5qn92gz15axnszm78znfs8";
  };

  cargoHash = "sha256-zKAwdNUrxGFSwX9/FOU/Nz9wkF5//tElTslqI59hNyg=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
