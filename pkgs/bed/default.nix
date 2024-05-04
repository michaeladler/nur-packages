{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "unstable-2024-05-03";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "7f1e7e7c0ecc7534666258b5c009eb461fe424ac";
    sha256 = "03qnva2zivxf0qsxwis6r6cnwflazadfcs1ybq6a3av653i2fq4b";
  };

  vendorHash = "sha256-OirZrytw/gy/wi/q4USPQk5O8LjirNDsRdh1ma9pUjs=";

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
