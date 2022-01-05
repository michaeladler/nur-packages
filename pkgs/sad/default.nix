{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-05";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "afe90bbbaf8c2491082046115d41cc533bb12c42";
    sha256 = "15xnc308ka053y4lpwx3l87mynfxgdrqgx01zax5myzp5bvlldp1";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
