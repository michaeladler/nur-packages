{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-04-29";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "b0d4d21e654839c54fa66160d0a40a7484a98fd9";
    sha256 = "sha256-UftYO6JgRwRLcubKWS8b27h/Iceb8br8IPlMApopvUc=";
  };

  cargoHash = "sha256-A7q0vNJAt+LoXOnP8xWZCuFw9U1Z/5kFqN0lj03P/5Y=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
