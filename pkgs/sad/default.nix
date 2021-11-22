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
    rev = "44068a739ce26328767bc7c361dcf98b3fb4810a";
    sha256 = "0qnvbzczzh2wfzafa1f5pjfyf0qvfvh61rqbck1xi3q04a725vl6";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
