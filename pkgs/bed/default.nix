{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "unstable-2022-12-25";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "c0b31fdd1f5476ba7abaf9bb5cab5ee972ea7bf7";
    sha256 = "0a7njvvscvp8xi9fswsyv9mvj3b3hj5ldhvbcnrvkqj1gbq22zy8";
  };

  vendorSha256 = "sha256-IJydneOVUOkuUPezcljLqGhq8rojqwx5LeAycXHbOUU=";

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
