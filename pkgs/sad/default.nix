{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2021-12-16";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "6c798e2a64dff72b31d41c3d3dab5ef77eaacbf2";
    sha256 = "1ay3dzvbfyvr0yjs284wav2wq1mvrzm1lz7mp41jknsfs2rpf40y";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
