{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-13";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "5fe51308aae59ccef41c45037ac5acbe3a0830e1";
    sha256 = "sha256-qTN34UjVMLKg4+CMPCaj5K9FD4dYc7FNSvxg35wrYLA=";
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
