final: prev:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
prev.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-06-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bdf3df4027a5389a46b4c9a75b50aff5c0ecb351";
    sha256 = "0a14ncp8m4lciykgnfzrm5y22av33iqibpk600142kysydl9xv1m";
    fetchSubmodules = true;
  };

  buildInputs = oa.buildInputs ++ [ final.tree-sitter ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${final.tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${final.tree-sitter}/lib/libtree-sitter.so"
  ];
})
