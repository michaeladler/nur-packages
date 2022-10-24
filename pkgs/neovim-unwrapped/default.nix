final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6da2271a04540f6f3bd6d3cae1895bb1ea1b5011";
    sha256 = "12lj131iwmv9jh9n6f2gbcryg7i5s4ic4xi4r2s5riy0rldgp834";
    fetchSubmodules = true;
  };

})
