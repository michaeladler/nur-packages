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
  version = "unstable-2023-06-25";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "5c98e2fe7674d39c9b7cf2dd84a88c8e74264dc0";
    sha256 = "0121hyr520cnzslb40aqd18g6ra8lz2fd0kfy6rq816drr0s23k1";
  };

  cargoHash = "sha256-auvCXQtfiOceZXSkiPFT+7A9R+78/tFZhbaQJaBYigo=";

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
