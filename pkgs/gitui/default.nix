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
  version = "unstable-2023-07-17";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "023f09b3270979a66374a761a2fad80fa393a8da";
    sha256 = "1y5ixz6bzmmsrxg406kdlf23yjn3drp47nis64hhyncy545mkgg1";
  };

  cargoHash = "sha256-sjFr5LxeRyJGtxdClGFPcUPxG1S2N22SY2/Sviv8kvs=";

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
