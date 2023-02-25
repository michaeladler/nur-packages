final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a601d031127689a7d60cc92f4ec89907794ed020";
    sha256 = "1hhjf705dk8rhidhxbw5sxlcqkam1xf70i7d984i1y5qga3c2wsf";
    fetchSubmodules = true;
  };

})
