{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.7-unstable-2024-10-30";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "5f76c98f3c0eb783cfcda17df941b429c8377dbc";
    sha256 = "sha256-kjCsnlLqcMFeOrjQc1HvLhJcBgGfHQY3JqHszax0d+U=";
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
