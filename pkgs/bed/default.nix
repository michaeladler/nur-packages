{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  name = "bed";
  version = "unstable-2022-09-21";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "e1058437c2bda70dc8ea23b287e6a92a552c7737";
    sha256 = "0gziafjfv7arviclpka55k436mnzg78ixv102hagki6fxyn7c4d1";
  };

  vendorSha256 = "sha256-5/XOa+PpNJeP3oC/aIq84b/c6LVEbpKuNR96RZP7e0s=";

  checkInputs = [ which ];

  dontPatchELF = true;

  patches = [
    ./0001-fix-support-for-block-devices.patch
  ];

  meta = with lib; {
    homepage = "https://github.com/itchyny/bed";
    description = "Binary editor written in Go";
    maintainers = with maintainers; [ michaeladler ];
    platforms = platforms.all;
    license = licenses.mit;
  };
}
