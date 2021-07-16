{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  name = "go-crx3";
  version = "2020-08-27";

  src = fetchFromGitHub {
    owner = "mmadfox/";
    repo = "go-crx3";
    rev = "48e0282c5c42660fe762f75d0a8010105c93b889";
    sha256 = "178y5f1kaczys9nyk9n6vn1mym9lvd5m49asvyina6r3dabznliz";
  };

  vendorSha256 = "sha256-ZNszEjwzCXaMcPYnes38WgTXsGfOOCL8zLV4cwuPo4M=";

  meta = with lib; {
    homepage = "https://github.com/mmadfox/go-crx3";
    description = "Chrome browser extension tools. Provides a set of tools packing, unpacking, zip, unzip, download, etc.";
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
