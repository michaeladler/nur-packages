{ stdenv
, lib
, makeWrapper
, fetchFromGitHub
, tree-sitter
, pkgs
}:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
pkgs.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-06-11";

  src = fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "81a6b70880efa21dc45c6b222ca3c2d794c85b36";
    sha256 = "0317ljng60xy043hvh72lm92nf11aiaixlb4zhykvmsj8kw0b8q2";
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
