{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-14";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "521e2529051ba47966516a9c1d924de865d2443b";
    sha256 = "sha256-77dWLNWsBzM9JJUb4/MiO5spdJkeMFzK4PoXJ8jbGo0=";
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
