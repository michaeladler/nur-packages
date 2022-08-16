final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "63e4436d8e9d25548cdc7c5b7e334ef164c150fc";
    sha256 = "16my76ih38p2016nvggqab82wdx1i4v920xn969rk6prrfblly99";
    fetchSubmodules = true;
  };

})
