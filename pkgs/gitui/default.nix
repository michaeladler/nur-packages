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
  version = "unstable-2023-04-26";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "836e03c01c9cadc07be0ce0ab7df097688ac34e1";
    sha256 = "0b83r2k21c46bhd6yf3picz15xq5mmfd1lh5wcakwywc1mcasz2k";
  };

  cargoHash = "sha256-FqdLx6hAACfdqe2zQ45BGYuLjRgNdFAMIiFlZYLhKRc=";

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
