final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a6747545be8371e53f16189219ec3950d4b219f7";
    sha256 = "050i1g2nrwkx0qsrmwlk15liq416hhss5k9l7607i1bz962k29n6";
    fetchSubmodules = true;
  };

})
