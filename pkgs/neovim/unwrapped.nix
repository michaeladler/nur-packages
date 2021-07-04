final: prev:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
prev.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-07-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "75f758b993b842c4afd03fdaa0063b573fdf8751";
    sha256 = "0672ygmw7an5p2vplr6dka5pmspivnhnlnh31wr0l039d4lss983";
    fetchSubmodules = true;
  };

  buildInputs = oa.buildInputs ++ [ final.tree-sitter ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${final.tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${final.tree-sitter}/lib/libtree-sitter.so"
  ];
})
