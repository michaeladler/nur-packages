final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c126c1f73a0bae3ac40ce460ef303348a671a08f";
    sha256 = "1vll1f9nfl1gkb4644drrzqq67daiqb3nv1qx1gd680y2aghvi4w";
    fetchSubmodules = true;
  };

})
