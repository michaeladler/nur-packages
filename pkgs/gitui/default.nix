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
  version = "unstable-2023-07-07";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "bdba06590941b19a0893a0074ce38c8780e11811";
    sha256 = "1swpafhrwy95q1xqpyzx8jm42zmrgxnrfcdssc7sjd5qgzx3wm0m";
  };

  cargoHash = "sha256-17R4tuYB+96bJuMp4oN6wTur2PvqPYOWMKcqr9RvSNo=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ]
    ++ lib.optional stdenv.isLinux xclip;

  # Needed to get openssl-sys to use pkg-config.
  OPENSSL_NO_VENDOR = 1;

  # The cargo config overrides linkers for some targets, breaking the build
  # on e.g. `aarch64-linux`. These overrides are not required in the Nix
  # environment: delete them.
  postPatch = "rm .cargo/config";

  meta = with lib; {
    description = "Blazing fast terminal-ui for Git written in Rust";
    homepage = "https://github.com/extrawurst/gitui";
    license = licenses.mit;
    maintainers = with maintainers; [ Br1ght0ne yanganto ];
  };
}
