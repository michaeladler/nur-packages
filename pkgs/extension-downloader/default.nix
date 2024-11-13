{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2024-11-12";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "2fe9be1815cd387d2d6d831d448263a8ad41e2f6";
    sha256 = "sha256-tOAkXRceIYmq9dI2GJ4H32uean++j3NWMqYPbLjdAuI=";
  };

  cargoHash = "sha256-U2ghjYYR/q/UCbulhWKqnEsgY1bNT3N6o1Qo2ZeN5yA=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
