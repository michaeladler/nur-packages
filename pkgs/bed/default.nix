{
  buildGoModule,
  fetchFromGitHub,
  lib,
  which,
}:

buildGoModule {
  pname = "bed";
  version = "0.2.8-unstable-2024-12-01";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "506f3317facca1585dc7409e3e16f37cd6563ca9";
    sha256 = "sha256-NXTQMyCI4PKaQPxZqklH03BEDMUrTCNtFUj2FNwIsNM=";
  };

  vendorHash = "sha256-tp83T6V4HM7SgpZASMWnIoqgw/s/DhdJMsCu2C6OuTo=";

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
