{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-04";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "4a77c7bfdf1208929ac1ecb85a3dc46fae27d5eb";
    sha256 = "0lhipj4f58kwjywy31n6n8l2bw9bxszc67c88980l6sldknivray";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
