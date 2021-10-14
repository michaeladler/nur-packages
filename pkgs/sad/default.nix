{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-10-13";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "1d408bcd3e5adac801aa332a32ed24dbd0d30bdb";
    sha256 = "1js9lcp8b92qrrr6slkddvcpjz8rbxr8r9r0p6wglzbd3gv3w0xn";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
