{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "0.1.0-unstable-2025-02-10";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "76ef9e016ef0f92c080630f1b6ecfad03c765478";
    sha256 = "sha256-XdqMpQiwHImTHe6Gc6RoSCchficH3Fl6SgVVo+NeBwo=";
  };

  cargoHash = "sha256-T0NTliXy9CyHc50fppusTDdyUgYIMoS/JVibzvyqHpc=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
