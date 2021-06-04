{ lib
, stdenv

  # nixpkgs functions
, buildGoModule
, buildVimPluginFrom2Nix
, fetchFromGitHub
, fetchpatch
, fetchurl
, substituteAll

  # Language dependencies
, python
, python3
, rustPlatform

  # Misc dependencies
, code-minimap
, dasht
, direnv
, fzf
, gnome
, khard
, languagetool
, meson
, nim
, nodePackages
, skim
, sqlite
, stylish-haskell
, tabnine
, vim
, which
, xkb-switch
, ycmd

  # command-t dependencies
, rake
, ruby

  # cpsm dependencies
, boost
, cmake
, icu
, ncurses

# nvim-treesitter dependencies
, tree-sitter

  # sved dependencies
, glib
, gobject-introspection
, wrapGAppsHook

  # vim-clap dependencies
, curl
, libgit2
, libiconv
, openssl
, pkg-config

# vim-go dependencies
, asmfmt
, delve
, errcheck
, gnused
, go-motion
, go-tools
, gocode
, gocode-gomod
, godef
, gogetdoc
, golangci-lint
, golint
, gomodifytags
, gopls
, gotags
, gotools
, iferr
, impl
, reftools
}:

self: super: {

  # Usage:
  # pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [ p.tree-sitter-c p.tree-sitter-java ... ])
  # or for all grammars:
  # pkgs.vimPlugins.nvim-treesitter.withPlugins (_: tree-sitter.allGrammars)
  nvim-treesitter = super.nvim-treesitter.overrideAttrs (old: {
    passthru.withPlugins =
      grammarFn: self.nvim-treesitter.overrideAttrs (_: {
        postPatch =
          let
            grammars = tree-sitter.withPlugins grammarFn;
          in
          ''
            rm -r parser
            ln -s ${grammars} parser
          '';
      });
  });

  telescope-nvim = super.telescope-nvim.overrideAttrs (old: {
    dependencies = with self; [ plenary-nvim popup-nvim ];
  });

  vim-SpellCheck = super.vim-SpellCheck.overrideAttrs (old: {
    dependencies = with self; [ vim-ingo-library ];
  });

  galaxyline-nvim = super.galaxyline-nvim.overrideAttrs (old: {
    dependencies = with self; [ nvim-web-devicons ];
  });

  vim-markdown = super.vim-markdown.overrideAttrs (old: {
    dependencies = with self; [ tabular ];
  });

  vim-pandoc = super.vim-pandoc.overrideAttrs (old: {
    dependencies = with self; [ vim-pandoc-syntax ];
  });

}
