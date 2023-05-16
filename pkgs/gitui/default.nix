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
  version = "unstable-2023-05-14";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "aa4266cd1f8ffda4c38b86e342ae3b9b38300f25";
    sha256 = "10fm0k92xzvvf4msp0irypgi445pjam8nlaa4ifv5pvxqxwgcqv8";
  };

  cargoHash = "sha256-o2i9VNi4Qocl+X/NQqPIHPk2cJZoSH6Chjy/OQYfSyg=";

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
