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
  version = "unstable-2023-04-21";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "3a6f292bf5400c98b369848f38d7b07e7eb66b54";
    sha256 = "0jn8r4nxs0bxi0b0llcp8ryz3mkc0ri0p9qhgyb7rv6r1pvqgggj";
  };

  cargoHash = "sha256-7/yMcxLA2xdt/zINy6McSoBk5+0u0p0rPC5eSdNpO8Q=";

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
