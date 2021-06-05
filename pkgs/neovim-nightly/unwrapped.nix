{ src
, stdenv
, lib
, makeWrapper
, fetchFromGitHub
, neovim-unwrapped
, tree-sitter
}:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
neovim-unwrapped.overrideAttrs (oa: {
  inherit src;
  version = toString src.lastModifiedDate;

  nativeBuildInputs = oa.nativeBuildInputs ++ [ makeWrapper ];

  buildInputs = oa.buildInputs ++ [ tree-sitter ];

  propagatedBuildInputs = (if builtins.hasAttr "propagatedBuildInputs" oa then oa.propagatedBuildInputs else []) ++ [ stdenv.cc.cc.lib ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${tree-sitter}/lib/libtree-sitter.so"
  ];
})
