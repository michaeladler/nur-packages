{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-26";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "242da724dabb4864686d6f21d9348281b9ee7ef1";
    sha256 = "0152lq8y1i3ifpld7lxc0ic1751bbd2ivi9rn86smhw8h6zm2bya";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
