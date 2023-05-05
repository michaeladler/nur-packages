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
  version = "unstable-2023-05-04";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "49cd7ea2db2edd02c3ee8ee6c9ee5fb83fe60910";
    sha256 = "15m465khlfcw5xnlsk5gn97br85135as7ym4fj4bq3rj4krsi106";
  };

  cargoHash = "sha256-p38Lh6qt8qRrpcepTBs9SH/340i9imIt/PzkSg30DUU=";

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
