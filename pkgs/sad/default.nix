{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-18";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "16d77240939d8957d6f22a79ab4670a49d992d28";
    sha256 = "0g856qvx9drbgdkvmx6clrxmbssb5djny7xycp0vg0v1cvvpdg2h";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
