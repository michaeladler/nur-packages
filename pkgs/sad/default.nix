{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-10";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "2c943d8ea3a87e52bced1349ec1b4a7217f264da";
    sha256 = "0gwaijv3nlzi87p01q3r5j5mavv3imyzyh7z6vliqfy18zyy6p6j";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
