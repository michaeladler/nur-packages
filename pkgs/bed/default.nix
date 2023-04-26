{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "unstable-2023-04-25";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "e328be7ff154ebfd15713c3c9a4b5775231593a4";
    sha256 = "08vbna7y87crvkgziwxjkrqb5vwbjhvm5vflc07sfsd6y2w5g1q5";
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
