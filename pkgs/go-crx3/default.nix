{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  pname = "go-crx3";
  version = "unstable-2024-06-26";

  src = fetchFromGitHub {
    owner = "mmadfox";
    repo = "go-crx3";
    rev = "94c08009bbd26902aa352caa26b33726006b0707";
    sha256 = "1cd5q260n3ywvxzs4xm25qh8d8ivr5mqa6l1kk4z9b7s3kyzfyr7";
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
