{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-02-02";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "a5500e5546f93a977342f4e46ad2558a56fc5eae";
    sha256 = "0cy16301zmm1ascnj4x5wmrgmxsdqs8a87qmxq1qxqmjqnv3h5yd";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
