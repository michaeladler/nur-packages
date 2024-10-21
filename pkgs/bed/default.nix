{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "0.2.7-unstable-2024-10-20";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "96f71989ba38e59a50356c0b4efb8af803288092";
    sha256 = "sha256-SjrNjboXHLHV5jPcS3A8kChD+OuJPU40QTp0BMIz184=";
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
