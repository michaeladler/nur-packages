{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-15";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "edc9de4b23792faf87e61a7b34abcbc3a7ef8a5f";
    sha256 = "10msgb51sn81yxpyjvw9c1vgwh98amb1vknr7pysh1s8ikcwzinw";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
