final: prev:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
prev.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-06-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6a77def1ee05d4e4eceddb559bc779cd9b805614";
    sha256 = "13029a60bip8nmlny4p6hrvvmhmw8d4cdl9waacdbbh9cmxlchyn";
    fetchSubmodules = true;
  };

  buildInputs = oa.buildInputs ++ [ final.tree-sitter ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${final.tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${final.tree-sitter}/lib/libtree-sitter.so"
  ];
})
