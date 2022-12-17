final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "4d860a537076d7eddfb29372ecbdacf1eb5b7d3b";
    sha256 = "1b3m3q2nqkpid6qxj7gq8yzk658lvjx6ybfkpy1c6gmxx1awrspf";
    fetchSubmodules = true;
  };

})
