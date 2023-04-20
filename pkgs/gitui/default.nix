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
  version = "unstable-2023-04-19";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "904885e001bddd3c2b36311d69debbc26c3623ca";
    sha256 = "0fjns4ydw9llckgmghz8185lmfl121v3gbi7ghrc8ljjh52cgbdx";
  };

  cargoHash = "sha256-oGBylLB7hMUUbLqQHo2AsmkxEzuNKDc89Bq9zA3m2Jo=";

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
