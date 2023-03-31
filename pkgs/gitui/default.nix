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
  version = "unstable-2023-03-20";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "9782eb7b1f7b2f43cfffb48a674e6c0bdee1e13b";
    sha256 = "0kh2sck24sp096zpw9jc3xgsva49v9920k6465q7123npm51bxln";
  };

  cargoHash = "sha256-XNR/eQ5+O9uco1a/ecOiHBl/rKB3rMBPObUD5KFlbdY=";

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
