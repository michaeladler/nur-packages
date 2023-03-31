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
  version = "unstable-2023-03-30";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "75abd0f283a9f0ae4e72e42a72ec875edc41c9ec";
    sha256 = "17ia303v32ad46x0rv4kks6i3qa2wdy939mqxvgahlz7s5dmbb3b";
  };

  cargoHash = "sha256-33T9Yx8nOuVm23tA9e2qCls+KU7ALBRjazpE21gfI54=";

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
