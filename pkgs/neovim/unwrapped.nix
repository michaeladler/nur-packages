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
  version = "2021-06-12";

  src = fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "12d8ff7ccdad4d5873347e8d318a47ac552941d7";
    sha256 = "095pvv4szzsh5vgivg3w4zslqix3v56fdz4v033yak17y1dd22hc";
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
