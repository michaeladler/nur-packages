{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "unstable-2024-09-25";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "9370229f7aef09e4b2be6c584d9b84cca63d2e3b";
    sha256 = "1yvkmc4mj8gr2ng12ps0zjg9bdz3l06qgh4lwvwp9jqlp5bkb8bb";
  };

  vendorHash = "sha256-OirZrytw/gy/wi/q4USPQk5O8LjirNDsRdh1ma9pUjs=";

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
