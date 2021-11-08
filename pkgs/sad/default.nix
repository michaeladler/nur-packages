{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-11-07";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "b34a8e87efebd9088abdfdccb67793eec0ee01b8";
    sha256 = "00zjlhhyg88i86lfk61i87hpj6adwgyyfg18rk1nadh9rzbfdr0w";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
