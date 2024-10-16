{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-15";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "dc20ecf0a5022ee32f083c5d15d97b206c952f53";
    sha256 = "sha256-L353CyUYR/2d4j8MDz6jiJNsrmwAFBe8RWEuSnCAZmk=";
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
