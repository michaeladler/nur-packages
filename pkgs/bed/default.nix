{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "unstable-2024-09-29";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "1f2e9d1911eda88a26d407469cc15cbbb47ee17b";
    sha256 = "03grdk4pfw07lb10r0diwjgbf85d5y5id5ky0p307a1s5vr9wj84";
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
