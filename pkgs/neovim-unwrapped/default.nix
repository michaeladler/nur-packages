final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d25889ab7607918a152bab5ce4d14e54575ec11b";
    sha256 = "1b7y1ma3v25najrm8xk6lfwbf2b24438nhniz03rdhqd2nvsx93p";
    fetchSubmodules = true;
  };

})
