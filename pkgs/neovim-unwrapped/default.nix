final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "58b29e344c639e47fd916129d2195883537357b6";
    sha256 = "031x1xcdffhg9bdhhhfkm99b60fcvc4ngp2iaw1kfbx2xaz2jgsr";
    fetchSubmodules = true;
  };

})
