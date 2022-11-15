{ buildGo119Module, fetchFromGitHub, lib }:

buildGo119Module {
  name = "go-crx3";
  version = "unstable-2022-11-14";

  src = fetchFromGitHub {
    owner = "mmadfox";
    repo = "go-crx3";
    rev = "b26a1a153fb1cf57d4758cd34855558a246e204d";
    sha256 = "056jk8l8457siwgh9q2zxllpzivx2fbz1jfjyy38zbcb6brcjg0a";
  };

  vendorSha256 = "sha256-uJFELBJy5lLmwvZizcIpgo6HcugX4jMIGN4d9NrAsVA=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/mmadfox/go-crx3";
    description = "Chrome browser extension tools. Provides a set of tools packing, unpacking, zip, unzip, download, etc.";
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
