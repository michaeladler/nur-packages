{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-14";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "ba4027506ac0749a4d61b9a28f831cbcfebe25e8";
    sha256 = "1601qcjz5sp7i9gx8s7cyb9jfbd3igk18l7lcr69206l811wdain";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
