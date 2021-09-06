{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-05";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "f36ad1314ac2dca07ebf718236b1553e31713404";
    sha256 = "1hr5d3g8d5jx6i4gv4ab8vwrypl15xjyh4r273n2j2xymdvr01fb";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
