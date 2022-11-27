final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3098064f332ffbc59c342545402e2d2da798a458";
    sha256 = "18jb1q4pwk8d7jf0x1nl4350nm3w844pay86gnk8hyxrrw0izrp9";
    fetchSubmodules = true;
  };

})
