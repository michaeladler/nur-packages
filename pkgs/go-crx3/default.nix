{ buildGo119Module, fetchFromGitHub, lib }:

buildGo119Module {
  pname = "go-crx3";
  version = "unstable-2023-09-14";

  src = fetchFromGitHub {
    owner = "mmadfox";
    repo = "go-crx3";
    rev = "7ce008dc962c619e5ff14a4cac1cb10090cafb82";
    sha256 = "0d780sgzf7grclafmza92jw0mfm72lx9lvm7pkqn9bg9clgn4js7";
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
