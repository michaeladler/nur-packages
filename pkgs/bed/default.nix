{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.7-unstable-2024-10-28";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "38ae0fb61e3076b4a66441d5fd156b103e35c017";
    sha256 = "sha256-w4av6KAfJZwJMTQ95/ptimI77cyW6d5k+shmKjA13T4=";
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
