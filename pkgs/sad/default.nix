{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-09-13";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "0441ae1c701bd64494916286cfd3201cef4c0731";
    sha256 = "1ys2sawv87zm7jrgsz62skxb0qhxllrh0pbgy6x220c0lgpbrbil";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
