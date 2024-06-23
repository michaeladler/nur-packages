{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  pname = "go-crx3";
  version = "unstable-2024-06-22";

  src = fetchFromGitHub {
    owner = "mmadfox";
    repo = "go-crx3";
    rev = "4a031289411a8895b5d0f759ca6ecc63ec92e7e0";
    sha256 = "0h7n546zjk2c0rjlsvs4777g5zw8nnhy4xhkili27kgbxnc8y04a";
  };

  vendorHash = "sha256-LEIB/VZA3rqTeH9SesZ/jrfVddl6xtmoRWHP+RwGmCk=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/mmadfox/go-crx3";
    description = "Chrome browser extension tools. Provides a set of tools packing, unpacking, zip, unzip, download, etc.";
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
