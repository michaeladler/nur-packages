{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.6-unstable-2024-10-07";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "d8efd951478ed2c58ecfa0adcb67a7f36c5e1dc3";
    sha256 = "sha256-aAAOxYgwmLgwZjxrRZJZGWDw8Y9n9LFTh/MxtkQUWVs=";
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
