final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "eee956051637a5dff02ba6c6083fbffc87c0c96e";
    sha256 = "1n24flxxwj6sh8i9p0bs3l2fcyb1y0pplc0g5s2ylpr51jm3gk0s";
    fetchSubmodules = true;
  };

})
