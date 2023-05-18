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
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "cdaf3b8b8407d920b6659d2483d838639d79c694";
    sha256 = "1q507gpfmlndg0yfz7a5570060h14sswspzh3xl25n5ay11wz5mg";
  };

  cargoHash = "sha256-KvLeIB4FBgYT483A/+N+JrzFNJ/JtAgvuHOJOk5jm9w=";

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
