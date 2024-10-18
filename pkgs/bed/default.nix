{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-17";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "c64264756688d295d1333aa3ac1a764c2f356792";
    sha256 = "sha256-jA9XI4fbHZLShvEK3UZMs6wTFZ+H2rbyDU4HY5XWlnw=";
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
