{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.7-unstable-2024-11-25";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "7cd1bb3105dcb027da727b138c4bcb7ff7a3d57d";
    sha256 = "sha256-UuYEtpjhT9+Gkk7o0OiUDu/a2grbFyY7BEtt60wiUEE=";
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
