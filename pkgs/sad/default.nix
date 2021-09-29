{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-29";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "5c54d1e8dfba0c128dc1a9df751bb25443552ba0";
    sha256 = "0rzz3h7fif690xb2wqwlqzhlhq9j9rzcrhb5i10g4js1dwnbbkm5";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
