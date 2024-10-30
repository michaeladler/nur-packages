{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.7-unstable-2024-10-28";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "3848992cf86b31acbe0540d998d81da6b696444f";
    sha256 = "sha256-oATHQIOs3Sd+HaksEUooruMExE7LDEJJ97gnnY6ENRM=";
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
