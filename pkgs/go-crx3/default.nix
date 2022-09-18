{ buildGo119Module, fetchFromGitHub, lib }:

buildGo119Module {
  name = "go-crx3";
  version = "unstable-2022-09-14";

  src = fetchFromGitHub {
    owner = "mmadfox";
    repo = "go-crx3";
    rev = "4f73dedc04a3898e6f18408ac628fcc7c49b8f2b"; # pin
    sha256 = "sha256-hTyrlQIHLGIKxhh1915yNuzx2M9l7U4K4WEYKMxK4uc=";
  };

  vendorSha256 = "sha256-uJFELBJy5lLmwvZizcIpgo6HcugX4jMIGN4d9NrAsVA=";

  patches = [
    ./0001-added-go.sum.patch
  ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/mmadfox/go-crx3";
    description = "Chrome browser extension tools. Provides a set of tools packing, unpacking, zip, unzip, download, etc.";
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
