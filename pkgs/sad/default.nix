{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-04";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "41166021d139d399bda3ee07cdb1b50b5ab93851";
    sha256 = "15v59rfdg2a59fps84j4hkaafkg3wm4v1ar4clp4jxcz4jf6f5sw";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
