{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-30";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "dc57d2e283bf127ab717020016da51af4204a04e";
    sha256 = "0bissv1z6xqwgq0wz1iyd2h91j3397csrhf0wf8yddc8vbvrwiqw";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
