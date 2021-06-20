final: prev:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
prev.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-06-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "997a9c879215bc01a928de3e762955878314ec6a";
    sha256 = "060bibf70qcyfl90ph82wn9z3blbykhbr2dihpi174sffklvrgp0";
    fetchSubmodules = true;
  };

  buildInputs = oa.buildInputs ++ [ final.tree-sitter ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${final.tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${final.tree-sitter}/lib/libtree-sitter.so"
  ];
})
