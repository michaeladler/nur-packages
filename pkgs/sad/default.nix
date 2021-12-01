{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-01";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "9fa4a612074ea534b9358386b99f402d4611d274";
    sha256 = "02vs514vs2bhl2zl3kw9v8gfmp6x625kprl5hhdw0q806g4jb2x2";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
