{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-16";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "9a28a0649344be2333296ec1e4d9063f921ddee9";
    sha256 = "sha256-kxRj0/eFVn295Fl1Te0ScyKQozNq8ClC+hutBP7BH20=";
  };

  vendorHash = "sha256-q81aV9a2I7iMGS+6ZQCXtYE5cqCyoIovd4Juy7D8Miw=";

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
