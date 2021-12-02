{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-02";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "57b62c2bb7aaccf83ed63bfd87cc5f9009b37551";
    sha256 = "04xw8n460ari7sadjjky7gawbxaa2kb9wpzyghrkrv0wjy5rwngm";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
