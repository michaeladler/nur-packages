{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-08";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "24ec4505da997959a3bac7f8d01e2c9a07dc0a4e";
    sha256 = "1gry13dv8brlzhdwhw2vcp5y00a5f86329qs5xqy6mizgd9awvkz";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
