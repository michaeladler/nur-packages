{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-15";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "179826fa0fc0748a4a30686e0fe5eb5893d0b041";
    sha256 = "0hj2zj4zv8nay8zvcqk5rmaj71s58w2zaifbviawnan11f2zax7v";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
