{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.7-unstable-2024-11-02";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "9a884dff4d38419da57905a2eab22883d078e6aa";
    sha256 = "sha256-6SIxpdlqikF0BjFZLJG4R2RZCl0KBMpE/EcvAyQx44Q=";
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
