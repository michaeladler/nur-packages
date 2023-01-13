final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "4876654d4cc9bb43f266c7c9d412f36ab57fa571";
    sha256 = "05dz5vw9cmwncijq37b51hl80fjw81r9w708k2p2873dx7ki8jxr";
    fetchSubmodules = true;
  };

})
