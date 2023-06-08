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
  version = "unstable-2023-06-07";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "7d5b7d2c38ff68092f69878a6bf2173676a8c51e";
    sha256 = "0lx36w27anbh2kghlyfwrmw59c7wrhpm052fyyysqs2j4q0hqpim";
  };

  cargoHash = "sha256-Xwz3ACmq4wBxA2MdICGUSsy3zYpdwSqhHd7Asoo8N5Q=";

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
