{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  pname = "go-crx3";
  version = "unstable-2024-06-21";

  src = fetchFromGitHub {
    owner = "mmadfox";
    repo = "go-crx3";
    rev = "3c2b00f7724665816af4dd323ba52dbda63fb524";
    sha256 = "0kpgkxrqm5mxzjzggdqk4m59l99dbcdra6zkvmg332li5y5bk040";
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
