{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-11";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "9e553ad018f626a7a75a9c4e560f63b8c64031b9";
    sha256 = "0702fhja5nfggkd166j9xif5s3aqk8nvpglhnc19kd6nrd92qqhp";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
