{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-18";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "c75a3329b9cbb0ab912ea995dcb0c232f7f6fc95";
    sha256 = "sha256-Cgv/B4QmdvM05S+NlFbOpXzE8PVzOm80S8JWR73FU+w=";
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
