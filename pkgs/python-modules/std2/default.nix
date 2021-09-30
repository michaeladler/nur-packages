{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonPackage {
  pname = "std2";
  version = "unstable-2021-09-06";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "std2";
    # sync with https://github.com/ms-jpq/coq_nvim/blob/coq/requirements.txt
    rev = "769d5491fd65d6ad651409f6dc46d9edbbb333d4"; # pin
    sha256 = "1n7nv9j4hdfg3q6z40whmpcy6jqyaj4pccdfi55acpr4fk5nm84m";
  };

  checkInputs = [ ];

  checkPhase = ''
    runHook preCheck
    python -m unittest
    runHook postCheck
  '';

  meta = with lib; {
    homepage = "https://github.com/ms-jpq/std2";
    description = "a std lib";
    license = "unknown";
  };
}
