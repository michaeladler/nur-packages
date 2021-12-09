{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-08";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "35624735f9784e5bc43b658e8f9b4639b085cfb1";
    sha256 = "088a768h18var0kccl1wcxybcd53af8c6pmf2ivwb7rwvdbxdc1n";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
