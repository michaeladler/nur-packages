{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-23";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "dcd4f6689a5f090e80946e690fd67dff804a4e1c";
    sha256 = "177c70p0qbmqgsgbzcgdr43vhnvwsdpizlhkrig0i2zpxh5zv7ps";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
