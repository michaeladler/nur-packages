final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8af3d641daf03610c824ca4e0dffa07db297cb5b";
    sha256 = "0kb7l7cs330xpdyb08k1lrl9254z2d1q8k7lwvvhc77y6603q9k4";
    fetchSubmodules = true;
  };

})
