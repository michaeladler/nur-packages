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
  version = "unstable-2023-04-12";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "3e0ec29d0da842ddd0b9cff15355f01206b7b814";
    sha256 = "17kx73zbilabm6my1381y8kjlcpr7hh2yax5vb4siqqmy7ymplxd";
  };

  cargoHash = "sha256-hqrs5x/s2U9dvZNf8reqzkes+YR4IicezgmyuOU/pUU=";

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
