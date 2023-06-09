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
  version = "unstable-2023-06-08";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "ff48840f2380368034e80dbcd6742b033873e8e5";
    sha256 = "0i04wlq5l1sd2vb1sr2jri1vz5a0s4k9lxg8pwfy51kppqfcszwg";
  };

  cargoHash = "sha256-hlw+oMGdaLiNwec6VV2/qZiQrDt8XQyGTwI3VkXxuCU=";

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
