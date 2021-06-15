{ stdenv
, lib
, makeWrapper
, fetchFromGitHub
, tree-sitter
, orig
}:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
orig.overrideAttrs (oa: {
  version = "2021-06-14";

  src = fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b28d458f8716be6d682390ea25a481b7dbb6e24d";
    sha256 = "144a45drpr32j0i853r54hy0b07zvhqps06046inkysk8lgpq7lv";
    fetchSubmodules = true;
  };

  nativeBuildInputs = oa.nativeBuildInputs ++ [ makeWrapper ];

  buildInputs = oa.buildInputs ++ [ tree-sitter ];

  propagatedBuildInputs = (if builtins.hasAttr "propagatedBuildInputs" oa then oa.propagatedBuildInputs else []) ++ [ stdenv.cc.cc.lib ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${tree-sitter}/lib/libtree-sitter.so"
  ];
})
