{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-20";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "d0cc103bf3b4270cbbf6b1d910ca6a5382f98f70";
    sha256 = "sha256-0Gv8R4M7VvnNZ86VvkJQqnCTyzaEbs5N9aDZzBiG9xw=";
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
