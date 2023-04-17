{ lib
, stdenv
, rustPlatform
, fetchFromGitHub
, libiconv
, openssl
, pkg-config
, xclip
}:

rustPlatform.buildRustPackage rec {
  pname = "gitui";
  version = "unstable-2023-04-17";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "8d6e30d2a64f1a2e2df96f87779908d9d6ab08ed";
    sha256 = "0gqx66xakpm7xhna7imi3hmj5zqbhm573w3hr0l34z7y8k98y5ph";
  };

  cargoHash = "sha256-Q8jQKveAw3q1ZpvlD9DC1zTKs9aU0YC1w+YKeVTHMZY=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ]
    ++ lib.optional stdenv.isLinux xclip;

  # Needed to get openssl-sys to use pkg-config.
  OPENSSL_NO_VENDOR = 1;

  # The cargo config overrides linkers for some targets, breaking the build
  # on e.g. `aarch64-linux`. These overrides are not required in the Nix
  # environment: delete them.
  postPatch = "rm .cargo/config";

  patches = [
    ./0001-fix-only-watch-directories-known-to-git.patch
  ];

  meta = with lib; {
    description = "Blazing fast terminal-ui for Git written in Rust";
    homepage = "https://github.com/extrawurst/gitui";
    license = licenses.mit;
    maintainers = with maintainers; [ Br1ght0ne yanganto ];
  };
}
