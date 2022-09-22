final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b4b05f160dbb6b9b945c173b7e910b0e4c1a8b01";
    sha256 = "1ryvmh6bqn95j3b8rdbw84si112kvkax93yhi7g39rl4gvx5xyfq";
    fetchSubmodules = true;
  };

})
