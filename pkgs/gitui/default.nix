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
  version = "unstable-2023-07-27";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "77f672570f022136de0bc9f7b37696fb1cb49c74";
    sha256 = "10dzqy8w661j0221j9nnrib09k7crmk0rwpy2g4l4i2cf66mkci5";
  };

  cargoHash = "sha256-dFoqzF/tc3uZHgSlq673F26sIQLk7WRvLLPtr0NJlVo=";

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
