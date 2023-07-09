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
  version = "unstable-2023-07-08";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "4682a1b75bafc06e7747f93da6cd5d084bd0bd11";
    sha256 = "0jhn3p34qqnajm8qyifdl8bi1l3k3ip7zc75kf2lxq9177ii9y0h";
  };

  cargoHash = "sha256-2B0xiAzZC8gwhLWR3wZOdr/jCfwB8Cix2VcJvnyW000=";

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
