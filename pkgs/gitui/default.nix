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
  version = "unstable-2023-05-21";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "2b3bc622d6ee83fe4fed254f31f134653875cc21";
    sha256 = "1n33rs0d789i4mmf96b0j0xn6nbr8pc4yf5l29xb2yj1kn4svyzs";
  };

  cargoHash = "sha256-bCnl2kb0k7UpA1LfRwInU1/2CuvrQgZfgxRKb1jazgA=";

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
