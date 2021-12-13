{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-12";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f39242756a36554cd54a8b00edcdce479649546a";
    sha256 = "127a3x5l13qkr9j2ad55f4cn5drkdlpkd374aldkir1ds1vway9d";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
