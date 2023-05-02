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
  version = "unstable-2023-05-02";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "9b09617f853f1ccfef58475834aca32876041079";
    sha256 = "1bb06zzsabdm1062q89vh9r5ifz4b9zmhdzjk8m9cdkn6pmbinbp";
  };

  cargoHash = "sha256-z0SkCvVUyu3imdsivg5MoD7rY/uij15U0VeB5JAuAag=";

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
