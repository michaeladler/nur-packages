final: prev:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
prev.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-06-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a03ffe16023faab119cefe28a4f465c9de767afd";
    sha256 = "1fj4sh77w59adpqrrx9slg2cdcsxmb2w9bzgqm63fqnwmz2bqzqk";
    fetchSubmodules = true;
  };

  buildInputs = oa.buildInputs ++ [ final.tree-sitter ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${final.tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${final.tree-sitter}/lib/libtree-sitter.so"
  ];
})
