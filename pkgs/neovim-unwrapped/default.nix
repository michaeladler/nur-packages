final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bc64aa435b84bb3a43501e101c51507c75fbd349";
    sha256 = "0lp10p8qlzsip3yfkwz7x1nxhh6wihbxyrxx6hifr08z3p4mszhi";
    fetchSubmodules = true;
  };

})
