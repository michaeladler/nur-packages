final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "286777c3335d9a4d2c30bfda23ba507fead02aee";
    sha256 = "1wc4j1dg8zz3mj29fbhzkrzpz9yn43mrrwlvjg5g196ya58r3cdm";
    fetchSubmodules = true;
  };

})
