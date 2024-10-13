{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-12";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "1ad431783d3919201c27c9bf4630595e6bf44313";
    sha256 = "sha256-VcevHmZacm+DPaN9sypyXSom8I9kdi+9pGfdDtO3Yuw=";
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
