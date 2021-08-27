{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-08-26";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "a944ff0b72b439e700c08bbfcbdcf42654752837";
    sha256 = "1xy3zzacfha9vk54cx9xj53r2qs3r6vkvhrw48pkf0pbk4j9l5vi";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
