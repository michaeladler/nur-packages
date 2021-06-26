final: prev:

# based on https://github.com/neovim/neovim/blob/master/contrib/flake.nix, but improved
# see also https://github.com/rvolosatovs/nixpkgs/tree/update/neovim
prev.neovim-unwrapped.overrideAttrs (oa: {
  version = "2021-06-25";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c1120ad0e1adf8b34ee10b63b2134fcb0d580fce";
    sha256 = "1kldr6ji4b1y8ck0jlmcmh7672ajacjzkzvraalp6jmsffq65hwz";
    fetchSubmodules = true;
  };

  buildInputs = oa.buildInputs ++ [ final.tree-sitter ];

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${final.tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${final.tree-sitter}/lib/libtree-sitter.so"
  ];
})
