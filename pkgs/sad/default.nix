{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-18";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "89f72618079283a7d309c2985a087e605c77f66e";
    sha256 = "0wxi9v2p6dbrknz62mishsl1pdcyspfiyg5c1di04xncilpqclk6";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
