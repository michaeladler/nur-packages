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
  version = "unstable-2023-06-19";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "be801a336f7fa1297c5184ffb26e7defb2fad7c3";
    sha256 = "0bfgxm6b3z6fwcywaq63mm2v7a4iv6q87a3cm3xhaym617v8x30n";
  };

  cargoHash = "sha256-f0Up022cVyIlEsiMxI+79q0+xhGm2aEYu+lCP4xReFc=";

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
