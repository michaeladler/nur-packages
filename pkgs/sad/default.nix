{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-04";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "b63eb19157739af33ebab4b5fbbd2e19bd6f46e9";
    sha256 = "1ccyhc7b1gyhs8n5db5i21gpmg80qdljz366khy2grnavi0whppf";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
