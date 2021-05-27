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

  buildInputs = oa.buildInputs ++ ([ tree-sitter ]);

  propagatedBuildInputs = [ stdenv.cc.cc.lib ];

  # plugins assume libstdc++.so.6 is available (e.g. using libuv's uv_dlopen)
  # TODO: use wrapperArgs in wrapNeovim and re-export customized wrapNeovim
  postInstall = ''
    wrapProgram $out/bin/nvim \
      --prefix LD_PRELOAD : ${
        lib.makeLibraryPath [ stdenv.cc.cc.lib ]
      }/libstdc++.so.6
  '';

  cmakeFlags = oa.cmakeFlags ++ [
    "-DUSE_BUNDLED=OFF"
    "-DTreeSitter_INCLUDE_DIR=${tree-sitter}/include"
    "-DTreeSitter_LIBRARY=${tree-sitter}/lib/libtree-sitter.so"
  ];
})
