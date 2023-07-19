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
  version = "unstable-2023-07-18";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "b935df59a1c60109e7c0423d9e25d62586beb5f0";
    sha256 = "0s56q5xp0g0347qg9cgllvmn5m480mpn7pw14zr00lwfy8hk0rh2";
  };

  cargoHash = "sha256-ut1oIaaZVH0gvo33ihGkrTw89SmTaqzY/50Z/7xnPgw=";

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
