{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-03";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "9305109c5b6815a5cd844e3eb47491c82356e871";
    sha256 = "0adxmqw8qfxjx3rmh2iifi876h0kgm6ly6zrbf2yf9vl2d02v8bz";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
