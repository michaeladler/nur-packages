{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-13";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "1cc0e6e427914ae4714d21c5a9c97655e5b38ddf";
    sha256 = "0s78vif88hyyd0dp8myqd1zk4k49913j0wq0fcrq9dzscf2m15sl";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
