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
  version = "unstable-2023-07-06";

  src = fetchFromGitHub {
    owner = "extrawurst";
    repo = "gitui";
    rev = "b4450f9bc3a19216b19dd19fee5afdd082701487";
    sha256 = "032r6ssazvkk7k06zy23w2rv04k48ls3qnak3zdrmd4m0xpqwkjb";
  };

  cargoHash = "sha256-Slja4QaUQZQrOUKN+QUBpZwgnqqN47tKWMCspcEvTtA=";

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
