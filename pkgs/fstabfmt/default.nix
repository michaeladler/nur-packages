{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  name = "fstabfmt";
  version = "unstable-2021-06-02";

  src = fetchFromGitHub {
    owner = "xyproto";
    repo = "fstabfmt";
    rev = "6f5aaa643c05f8d7ce47c37967b1fcdb99a9af1f";
    sha256 = "0c9qg18l6xa0bck82z6i8sd6bhxnz4jka3xxw2ji0z09jkpcgqls";
  };

  vendorSha256 = "sha256-pQpattmS9VmO3ZIQUFn66az8GSmB4IvYhTTCFn6SUmo=";

  meta = with lib; {
    homepage = "https://github.com/xyproto/fstabfmt";
    description = "Format /etc/fstab automatically";
    platforms = platforms.all;
    license = licenses.bsd3;
  };
}
