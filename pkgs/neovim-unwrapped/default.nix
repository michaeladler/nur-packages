final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "86f9e29c86af9a7f6eb30a7d8ff529898a8b20ec";
    sha256 = "1c8p9fn9mw8grcg9c75im29x7zam6a78i1mnjmbz36m9gn75d8ki";
    fetchSubmodules = true;
  };

})
