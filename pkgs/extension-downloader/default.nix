{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
  cacert,
}:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.2.0-unstable-2026-06-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "1f916387151463da37dff48d50ccd6fdca1e21ad";
    sha256 = "sha256-shu533Be8uqrkaH4NrhkdM9MO9gAlKzrAPXnJIYbINk=";
  };

  cargoHash = "sha256-uEg1Lkeqhv5o3whEXrRHPPoSPA2YqC2A0Av1yJxkQ+4=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  checkInputs = [ cacert ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
