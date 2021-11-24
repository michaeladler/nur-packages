{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-22";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "08ef66ab11eac3288fcc23063f656ba1f396d44f";
    sha256 = "099zk0ss208gjivmyxw80bg3xwpnkrpfl8yw6yqd407ww6m2db93";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
