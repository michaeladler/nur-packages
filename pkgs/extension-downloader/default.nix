{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-06-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "ca20b1e121195c76c8f7728b4c1053f4026885b0";
    sha256 = "sha256-1QM5o42e41vADKrFN9xNdUr6RES2johe0fkywr+oEk4=";
  };

  cargoHash = "sha256-8QKodxwSxi37H7PxHHe3K0ejsjuosw8yHR1A9211gF4=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
