{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-11";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "3eabed454a868fd7452ecc8f0988dcc9ed34bfde";
    sha256 = "0m77npp3al90df0s2z04mf40yahgkmq1d5w2jv03zxb26fg30q7w";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
