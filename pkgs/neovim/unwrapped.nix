final: prev:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
prev.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-06-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "510ed996d2a92de527c70888208e3ad7ce157126";
    sha256 = "0fwi51jy17svshd1vsxq5vz290rkq59fq1d71xqxzhvj2msp10l7";
    fetchSubmodules = true;
  };

  buildInputs = oa.buildInputs ++ [ final.tree-sitter ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${final.tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${final.tree-sitter}/lib/libtree-sitter.so"
  ];
})
