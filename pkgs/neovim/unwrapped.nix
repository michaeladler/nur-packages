final: prev:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
prev.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-06-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5aaa1a1c0473d9e9ac824201f92ec65e190beeb7";
    sha256 = "1k3r9m3rdahfziyn7pk1swah81n26cc0a9hg1hbrfs5f1apyrwry";
    fetchSubmodules = true;
  };

  buildInputs = oa.buildInputs ++ [ final.tree-sitter ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${final.tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${final.tree-sitter}/lib/libtree-sitter.so"
  ];
})
