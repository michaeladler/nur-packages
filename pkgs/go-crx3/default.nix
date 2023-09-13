{ buildGo119Module, fetchFromGitHub, lib }:

buildGo119Module {
  pname = "go-crx3";
  version = "unstable-2023-09-13";

  src = fetchFromGitHub {
    owner = "mmadfox";
    repo = "go-crx3";
    rev = "432618a15a95bea223d27b65fbe4b731212f5397";
    sha256 = "1hiz1b0ihrkgz70b6dmb2l1csjijmxm5z4n3fghxcilf8kshm2rp";
  };

  vendorSha256 = "sha256-WoC9m50ls90kXj0qDo8+8X0GqKjc4XcXGruJgZju8rE=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/mmadfox/go-crx3";
    description = "Chrome browser extension tools. Provides a set of tools packing, unpacking, zip, unzip, download, etc.";
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
