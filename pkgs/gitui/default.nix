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
  version = "unstable-2023-06-21";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "7ebb3c0ef62dc338ec8d8dbfbf59052a146fe48a";
    sha256 = "1m4cn1wmzdn0rxxrjjkm6m5xkypsy94mn5mmw0q0433g8hag1s79";
  };

  cargoHash = "sha256-fxMH9f434B33EIktAXkitHhZsTxW5nW5RRtpZSOsxhE=";

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
