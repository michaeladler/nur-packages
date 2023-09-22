{ buildGo119Module, fetchFromGitHub, lib }:

buildGo119Module {
  pname = "go-crx3";
  version = "unstable-2023-09-21";

  src = fetchFromGitHub {
    owner = "mmadfox";
    repo = "go-crx3";
    rev = "86ca47bccb59c07770b2b523d30609f17f1ef522";
    sha256 = "14zwsjhzjc79fxw6qj2h46n01lz8zsshqjdqmxrvz344h4c00dpn";
  };

  vendorSha256 = "sha256-LEIB/VZA3rqTeH9SesZ/jrfVddl6xtmoRWHP+RwGmCk=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/mmadfox/go-crx3";
    description = "Chrome browser extension tools. Provides a set of tools packing, unpacking, zip, unzip, download, etc.";
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
