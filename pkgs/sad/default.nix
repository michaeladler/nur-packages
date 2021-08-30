{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-29";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "0eddaf989964257f3d7587cdafbd041c8dd99eae";
    sha256 = "0ssv1dn6afpaaprg27ql116n60ybbcf2s5ykw0jg0f7fdmkh7ndb";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
