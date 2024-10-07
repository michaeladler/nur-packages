{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.5-unstable-2024-10-01";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "74be8c4507ff2d2481972c63abe03e0aac2d2704";
    sha256 = "sha256-3B0psG7MMmbwFGumKeqxMXgHZba27vgxp6Z4UfesaDo=";
  };

  vendorHash = "sha256-mHdgNLpQp9KtssOJuXifF+ZaEecIr0bko3cMINyn9Kc=";

  nativeCheckInputs = [ which ];

  dontPatchELF = true;

  meta = with lib; {
    homepage = "https://github.com/itchyny/bed";
    description = "Binary editor written in Go";
    maintainers = with maintainers; [ michaeladler ];
    platforms = platforms.all;
    license = licenses.mit;
  };
}
