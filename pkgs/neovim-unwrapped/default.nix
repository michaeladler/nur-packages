final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a069e88b4ea593419181271bfb41154e45b81090";
    sha256 = "0vk7n5b1x018yr4qivd2zjb1wcmpjf5hp232637avqjnmrbq0643";
    fetchSubmodules = true;
  };

})
