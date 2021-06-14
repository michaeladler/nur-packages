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
  version = "2021-06-13";

  src = fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2f0e5e7e67faa469f5d12a66ec084ab9c35d8c6b";
    sha256 = "089l50i7wvycb3jbffm452785y361k086d8sfxa7nypg6jd9njhn";
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
