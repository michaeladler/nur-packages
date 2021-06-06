{ sources, vimPlugins, vimUtils, vim }:

let
  inherit (vimUtils.override { inherit vim; }) buildVimPluginFrom2Nix;
in
rec {

  ale = vimPlugins.ale.overrideAttrs (old:
    let src = sources.ale-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  barbar-nvim = vimPlugins.barbar-nvim.overrideAttrs (old:
    let src = sources.barbar-nvim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  editorconfig-vim = vimPlugins.editorconfig-vim.overrideAttrs (old:
    let src = sources.editorconfig-vim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  file-line = vimPlugins.file-line.overrideAttrs (old:
    let src = sources.file-line-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  friendly-snippets = vimPlugins.friendly-snippets.overrideAttrs (old:
    let src = sources.friendly-snippets-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  gina-vim = vimPlugins.gina-vim.overrideAttrs (old:
    let src = sources.gina-vim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  neoformat = vimPlugins.neoformat.overrideAttrs (old:
    let src = sources.neoformat-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  nvim-colorizer-lua = vimPlugins.nvim-colorizer-lua.overrideAttrs (old:
    let src = sources.nvim-colorizer-lua-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  nvim-compe = vimPlugins.nvim-compe.overrideAttrs (old:
    let src = sources.nvim-compe-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  completion-buffers = vimPlugins.completion-buffers.overrideAttrs (old:
    let src = sources.completion-buffers-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  completion-nvim = vimPlugins.completion-nvim.overrideAttrs (old:
    let src = sources.completion-nvim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  nvim-lightbulb = vimPlugins.nvim-lightbulb.overrideAttrs (old:
    let src = sources.nvim-lightbulb-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  nvim-lspconfig = vimPlugins.nvim-lspconfig.overrideAttrs (old:
    let src = sources.nvim-lspconfig-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  nvim-peekup = vimPlugins.nvim-peekup.overrideAttrs (old:
    let src = sources.nvim-peekup-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  nvim-treesitter = vimPlugins.nvim-treesitter.overrideAttrs (old:
    let src = sources.nvim-treesitter-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  nvim-treesitter-refactor = vimPlugins.nvim-treesitter-refactor.overrideAttrs (old:
    let src = sources.nvim-treesitter-refactor-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  nvim-treesitter-textobjects = vimPlugins.nvim-treesitter-textobjects.overrideAttrs (old:
    let src = sources.nvim-treesitter-textobjects-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  papercolor-theme = vimPlugins.papercolor-theme.overrideAttrs (old:
    let src = sources.papercolor-theme-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  plenary-nvim = vimPlugins.plenary-nvim.overrideAttrs (old:
    let src = sources.plenary-nvim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  popup-nvim = vimPlugins.popup-nvim.overrideAttrs (old:
    let src = sources.popup-nvim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  rust-vim = vimPlugins.rust-vim.overrideAttrs (old:
    let src = sources.rust-vim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  tabular = vimPlugins.tabular.overrideAttrs (old:
    let src = sources.tabular-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  telescope-nvim = vimPlugins.telescope-nvim.overrideAttrs (old:
    let src = sources.telescope-nvim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  undotree = vimPlugins.undotree.overrideAttrs (old:
    let src = sources.undotree-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-better-whitespace = vimPlugins.vim-better-whitespace.overrideAttrs (old:
    let src = sources.vim-better-whitespace-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-commentary = vimPlugins.vim-commentary.overrideAttrs (old:
    let src = sources.vim-commentary-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-cool = vimPlugins.vim-cool.overrideAttrs (old:
    let src = sources.vim-cool-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-dispatch = vimPlugins.vim-dispatch.overrideAttrs (old:
    let src = sources.vim-dispatch-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-json = vimPlugins.vim-json.overrideAttrs (old:
    let src = sources.vim-json-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-lastplace = vimPlugins.vim-lastplace.overrideAttrs (old:
    let src = sources.vim-lastplace-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-nix = vimPlugins.vim-nix.overrideAttrs (old:
    let src = sources.vim-nix-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-obsession = vimPlugins.vim-obsession.overrideAttrs (old:
    let src = sources.vim-obsession-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-prosession = vimPlugins.vim-prosession.overrideAttrs (old:
    let src = sources.vim-prosession-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-repeat = vimPlugins.vim-repeat.overrideAttrs (old:
    let src = sources.vim-repeat-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-sensible = vimPlugins.vim-sensible.overrideAttrs (old:
    let src = sources.vim-sensible-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-sneak = vimPlugins.vim-sneak.overrideAttrs (old:
    let src = sources.vim-sneak-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-startuptime = vimPlugins.vim-startuptime.overrideAttrs (old:
    let src = sources.vim-startuptime-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-surround = vimPlugins.vim-surround.overrideAttrs (old:
    let src = sources.vim-surround-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-tmux-navigator = vimPlugins.vim-tmux-navigator.overrideAttrs (old:
    let src = sources.vim-tmux-navigator-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-toml = vimPlugins.vim-toml.overrideAttrs (old:
    let src = sources.vim-toml-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-vinegar = vimPlugins.vim-vinegar.overrideAttrs (old:
    let src = sources.vim-vinegar-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-vsnip = vimPlugins.vim-vsnip.overrideAttrs (old:
    let src = sources.vim-vsnip-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-which-key = vimPlugins.vim-which-key.overrideAttrs (old:
    let src = sources.vim-which-key-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  zig-vim = vimPlugins.zig-vim.overrideAttrs (old:
    let src = sources.zig-vim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    }
  );

  vim-go = vimPlugins.vim-go.overrideAttrs (old:
    let src = sources.vim-go-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    });

  galaxyline-nvim = vimPlugins.galaxyline-nvim.overrideAttrs (old:
    let src = sources.galaxyline-nvim-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
      dependencies = [ nvim-web-devicons ];
    });

  vim-pandoc-syntax = vimPlugins.vim-pandoc-syntax.overrideAttrs (old:
    let src = sources.vim-pandoc-syntax-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
    });

  vim-pandoc = vimPlugins.vim-pandoc.overrideAttrs (old:
    let src = sources.vim-pandoc-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
      dependencies = [ vim-pandoc-syntax ];
    });

  vim-markdown = vimPlugins.vim-markdown.overrideAttrs (old:
    let src = sources.vim-markdown-src; in
    {
      inherit src;
      version = toString src.lastModifiedDate;
      dependencies = [ tabular ];
    });

  ###############################################################################
  # the following plugins are not (yet) available in nixpkgs:
  ###############################################################################

  vim-ingo-library = buildVimPluginFrom2Nix (
    let src = sources.vim-ingo-library-src; in
    {
      pname = "vim-ingo-library";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/inkarkat/vim-ingo-library/";
    }
  );

  vim-SpellCheck = buildVimPluginFrom2Nix (
    let src = sources.vim-SpellCheck-src; in
    {
      pname = "vim-SpellCheck";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/inkarkat/vim-SpellCheck/";
      dependencies = [ vim-ingo-library ];
    }
  );

  nvim-web-devicons = buildVimPluginFrom2Nix (
    let src = sources.nvim-web-devicons-src; in
    {
      pname = "nvim-web-devicons";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/kyazdani42/nvim-web-devicons/";
    }
  );

  FixCursorHold-nvim = buildVimPluginFrom2Nix (
    let src = sources.FixCursorHold-nvim-src; in
    {
      pname = "FixCursorHold-nvim";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/antoinemadec/FixCursorHold.nvim/";
    }
  );

  FTerm-nvim = buildVimPluginFrom2Nix (
    let src = sources.FTerm-nvim-src; in
    {
      pname = "FTerm-nvim";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/numtostr/FTerm.nvim/";
    }
  );

  indent-guides-nvim = buildVimPluginFrom2Nix (
    let src = sources.indent-guides-nvim-src; in
    {
      pname = "indent-guides-nvim";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/glepnir/indent-guides.nvim/";
    }
  );

  detectindent = buildVimPluginFrom2Nix (
    let src = sources.detectindent-src; in
    {
      pname = "detectindent";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/ciaranm/detectindent/";
    }
  );

  diffconflicts = buildVimPluginFrom2Nix (
    let src = sources.diffconflicts-src; in
    {
      pname = "diffconflicts";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/whiteinge/diffconflicts/";
    }
  );

  vim-bitbake = buildVimPluginFrom2Nix (
    let src = sources.vim-bitbake-src; in
    {
      pname = "vim-bitbake";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/kergoth/vim-bitbake";
    }
  );

  vim-boxdraw = buildVimPluginFrom2Nix (
    let src = sources.vim-boxdraw-src; in
    {
      pname = "vim-boxdraw";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/gyim/vim-boxdraw";
    }
  );

  vim-enmasse = buildVimPluginFrom2Nix (
    let src = sources.vim-enmasse-src; in
    {
      pname = "vim-enmasse";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/Olical/vim-enmasse";
    }
  );

  vim-spellsync = buildVimPluginFrom2Nix (
    let src = sources.vim-spellsync-src; in
    {
      pname = "vim-spellsync";
      inherit src;
      version = toString src.lastModifiedDate;
      meta.homepage = "https://github.com/micarmst/vim-spellsync";
    }
  );


}
