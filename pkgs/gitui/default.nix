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
  version = "unstable-2023-07-09";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "c1e209581b3d2f68c4138bbba6fce3e3e21adb9e";
    sha256 = "1pgjsabsjrzrxg9s04x0jshwdq48321njqmy7c510ylrz0lrxlza";
  };

  cargoHash = "sha256-rUNILY3mYxy0OcBnVo30eZ5H6uhoa8v7roy7ThU/g5s=";

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
