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
  version = "unstable-2023-04-22";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "48d42abd38d79ba42c8b3d1ad87fb61bdd1d2140";
    sha256 = "0c1l1v62v5d3mxxdnd60hma2j372p59r6z7q8f39xd2gsx8f1v08";
  };

  cargoHash = "sha256-/j6RcHXscySGBkS8dDtS9RHX8axkCWVTgSSbDSMAPjY=";

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
