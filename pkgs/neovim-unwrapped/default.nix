final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f905ab04507fc5a86affeb5eaf8550c1795ac9b8";
    sha256 = "0izmxx9ldynvzf03miimk04m6qbi8d04bpwsk7kyf0g6iz4gfgrn";
    fetchSubmodules = true;
  };

})
