final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "773febc46087b5b38c1923389667b1513a78c089";
    sha256 = "16s344xhjz099hlavpz54fkpgsga3waglmf5i5vqk7ajgmq9jqy9";
    fetchSubmodules = true;
  };

})
