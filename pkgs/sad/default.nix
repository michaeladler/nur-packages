{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-14";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "8bb9c7abe40d801e461dc0d8a5c870dc023a070e";
    sha256 = "1zb73m53fzg1qnqwqxh32fm4x2bbhdq92k1640nxhr6mz0m90jmp";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
