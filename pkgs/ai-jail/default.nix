{
  lib,
  fetchFromGitHub,
  rustPlatform,
  bubblewrap,
  makeWrapper,
  ...
}:

rustPlatform.buildRustPackage {
  name = "ai-jail";
  src = fetchFromGitHub {
    owner = "akitaonrails";
    repo = "ai-jail";
    rev = "228d1308e1eb7499abd57033b7b2c64131e11e51";
    sha256 = "06a27q8jjp6kqdvkmilgvs32m37nmx8wn3mijy40kq9db6k0jhgx";
  };

  patches = [
    ./0001-Revert-broken-patch.patch
  ];

  cargoHash = "sha256-txaNB1nkKEMpCZC6mGmXNbp7McoJdlo5CybFByMgHCQ=";

  buildInputs = [ bubblewrap ];
  nativeBuildInputs = [ makeWrapper ];

  postFixup = ''
    wrapProgram "$out/bin/ai-jail" \
      --set BWRAP_BIN "${bubblewrap}/bin/bwrap"
  '';

  meta = with lib; {
    description = "Multi-OS sandbox to run AI agents with better constraints (it is not 100% secure, but enough)";
    homepage = "https://github.com/akitaonrails/ai-jail";
    license = licenses.gpl3;
    maintainers = with maintainers; [ michaeladler ];
  };
}
