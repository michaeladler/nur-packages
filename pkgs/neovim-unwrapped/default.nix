final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e6c214033a4fadf60faf99e95f8e9787e3c5e630";
    sha256 = "10j1079qs3x2ld4ah8d1nr94smj6mrwa0rm0kb4sfqnppqyf93bw";
    fetchSubmodules = true;
  };

})
