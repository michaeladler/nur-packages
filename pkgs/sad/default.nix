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
    rev = "cdc47ed38c29b95a61e380f272bc00f321148576";
    sha256 = "1ssvg0kdsw5ff4ljpah42gbnp0rlnq8d1lsb59va4dfvjhgr4yjr";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
