{
  description = "My NUR";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.dwm-src = {
    url = "github:LukeSmithxyz/dwm";
    flake = false;
  };

  inputs.dwmblocks-src = {
    url = "github:lukesmithxyz/dwmblocks";
    flake = false;
  };

  inputs.git-buildpackage-src = {
    url = "github:agx/git-buildpackage";
    flake = false;
  };

  inputs.luaprompt-src = {
    url = "github:dpapavas/luaprompt";
    flake = false;
  };

  inputs.mutt-filters-src = {
    url = "github:terabyte/mutt-filters";
    flake = false;
  };

  inputs.neomutt-src = {
    url = "github:neomutt/neomutt";
    flake = false;
  };

  inputs.neovim-src = {
    url = "github:neovim/neovim";
    flake = false;
  };

  inputs.oelint-adv-src = {
    url = "github:priv-kweihmann/oelint-adv";
    flake = false;
  };

  inputs.oelint-parser-src = {
    url = "github:priv-kweihmann/oelint-parser";
    flake = false;
  };

  inputs.st-src = {
    url = "github:LukeSmithxyz/st";
    flake = false;
  };

  inputs.zls-src = {
    url = "https://github.com/zigtools/zls.git";
    type = "git";
    flake = false;
    submodules = true;
  };

  ###############################################################################
  ## tmux plugins
  inputs.tmux-continuum-src = {
    url = "github:tmux-plugins/tmux-continuum";
    flake = false;
  };

  inputs.tmux-copycat-src = {
    url = "github:tmux-plugins/tmux-copycat";
    flake = false;
  };

  inputs.tmux-dracula-src = {
    url = "github:dracula/tmux";
    flake = false;
  };

  inputs.tmux-fzf-src = {
    url = "github:sainnhe/tmux-fzf";
    flake = false;
  };

  inputs.tmux-open-src = {
    url = "github:tmux-plugins/tmux-open";
    flake = false;
  };

  inputs.tmux-resurrect-src = {
    url = "github:tmux-plugins/tmux-resurrect";
    flake = false;
  };

  inputs.tmux-sensible-src = {
    url = "github:tmux-plugins/tmux-sensible";
    flake = false;
  };

  inputs.tmux-sessionist-src = {
    url = "github:tmux-plugins/tmux-sessionist";
    flake = false;
  };

  inputs.tmux-tilish-src = {
    url = "github:jabirali/tmux-tilish";
    flake = false;
  };

  inputs.tmux-yank-src = {
    url = "github:tmux-plugins/tmux-yank";
    flake = false;
  };
  ###############################################################################

  ###############################################################################
  ## vim plugins
  ###############################################################################
  inputs.FTerm-nvim-src = {
    url = "github:numtostr/FTerm.nvim";
    flake = false;
  };

  inputs.FixCursorHold-nvim-src = {
    url = "github:antoinemadec/FixCursorHold.nvim";
    flake = false;
  };

  inputs.ale-src = {
    url = "github:dense-analysis/ale";
    flake = false;
  };

  inputs.barbar-nvim-src = {
    url = "github:romgrk/barbar.nvim";
    flake = false;
  };

  inputs.detectindent-src = {
    url = "github:ciaranm/detectindent";
    flake = false;
  };

  inputs.diffconflicts-src = {
    url = "github:whiteinge/diffconflicts";
    flake = false;
  };

  inputs.editorconfig-vim-src = {
    url = "github:editorconfig/editorconfig-vim";
    flake = false;
  };

  inputs.file-line-src = {
    url = "github:vim-scripts/file-line";
    flake = false;
  };

  inputs.friendly-snippets-src = {
    url = "github:rafamadriz/friendly-snippets";
    flake = false;
  };

  inputs.galaxyline-nvim-src = {
    url = "github:glepnir/galaxyline.nvim";
    flake = false;
  };

  inputs.gina-vim-src = {
    url = "github:lambdalisue/gina.vim";
    flake = false;
  };

  inputs.indent-guides-nvim-src = {
    url = "github:glepnir/indent-guides.nvim";
    flake = false;
  };

  inputs.neoformat-src = {
    url = "github:sbdchd/neoformat";
    flake = false;
  };

  inputs.nvim-colorizer-lua-src = {
    url = "github:norcalli/nvim-colorizer.lua";
    flake = false;
  };

  inputs.nvim-compe-src = {
    url = "github:hrsh7th/nvim-compe";
    flake = false;
  };

  inputs.nvim-lightbulb-src = {
    url = "github:kosayoda/nvim-lightbulb";
    flake = false;
  };

  inputs.nvim-lspconfig-src = {
    url = "github:neovim/nvim-lspconfig";
    flake = false;
  };

  inputs.nvim-peekup-src = {
    url = "github:gennaro-tedesco/nvim-peekup";
    flake = false;
  };

  inputs.nvim-treesitter-src = {
    url = "github:nvim-treesitter/nvim-treesitter";
    flake = false;
  };

  inputs.nvim-treesitter-refactor-src = {
    url = "github:nvim-treesitter/nvim-treesitter-refactor";
    flake = false;
  };

  inputs.nvim-treesitter-textobjects-src = {
    url = "github:nvim-treesitter/nvim-treesitter-textobjects";
    flake = false;
  };

  inputs.nvim-web-devicons-src = {
    url = "github:kyazdani42/nvim-web-devicons";
    flake = false;
  };

  inputs.papercolor-theme-src = {
    url = "github:NLKNguyen/papercolor-theme";
    flake = false;
  };

  inputs.plenary-nvim-src = {
    url = "github:nvim-lua/plenary.nvim";
    flake = false;
  };

  inputs.popup-nvim-src = {
    url = "github:nvim-lua/popup.nvim";
    flake = false;
  };

  inputs.rust-vim-src = {
    url = "github:rust-lang/rust.vim";
    flake = false;
  };

  inputs.tabular-src = {
    url = "github:godlygeek/tabular";
    flake = false;
  };

  inputs.telescope-nvim-src = {
    url = "github:nvim-telescope/telescope.nvim";
    flake = false;
  };

  inputs.undotree-src = {
    url = "github:mbbill/undotree";
    flake = false;
  };

  inputs.vim-SpellCheck-src = {
    url = "github:inkarkat/vim-SpellCheck";
    flake = false;
  };

  inputs.vim-better-whitespace-src = {
    url = "github:ntpeters/vim-better-whitespace";
    flake = false;
  };

  inputs.vim-bitbake-src = {
    url = "github:kergoth/vim-bitbake";
    flake = false;
  };

  inputs.vim-boxdraw-src = {
    url = "github:michaeladler/vim-boxdraw";
    flake = false;
  };

  inputs.vim-commentary-src = {
    url = "github:tpope/vim-commentary";
    flake = false;
  };

  inputs.vim-cool-src = {
    url = "github:romainl/vim-cool";
    flake = false;
  };

  inputs.vim-dispatch-src = {
    url = "github:tpope/vim-dispatch";
    flake = false;
  };

  inputs.vim-enmasse-src = {
    url = "github:Olical/vim-enmasse";
    flake = false;
  };

  inputs.vim-go-src = {
    url = "github:fatih/vim-go";
    flake = false;
  };

  inputs.vim-ingo-library-src = {
    url = "github:inkarkat/vim-ingo-library";
    flake = false;
  };

  inputs.vim-json-src = {
    url = "github:elzr/vim-json";
    flake = false;
  };

  inputs.vim-lastplace-src = {
    url = "github:farmergreg/vim-lastplace";
    flake = false;
  };

  inputs.vim-markdown-src = {
    url = "github:plasticboy/vim-markdown";
    flake = false;
  };

  inputs.vim-nix-src = {
    url = "github:LnL7/vim-nix";
    flake = false;
  };

  inputs.vim-obsession-src = {
    url = "github:tpope/vim-obsession";
    flake = false;
  };

  inputs.vim-pandoc-src = {
    url = "github:vim-pandoc/vim-pandoc";
    flake = false;
  };

  inputs.vim-pandoc-syntax-src = {
    url = "github:vim-pandoc/vim-pandoc-syntax";
    flake = false;
  };

  inputs.vim-prosession-src = {
    url = "github:dhruvasagar/vim-prosession";
    flake = false;
  };

  inputs.vim-repeat-src = {
    url = "github:tpope/vim-repeat";
    flake = false;
  };

  inputs.vim-sensible-src = {
    url = "github:tpope/vim-sensible";
    flake = false;
  };

  inputs.vim-sneak-src = {
    url = "github:justinmk/vim-sneak";
    flake = false;
  };

  inputs.vim-spellsync-src = {
    url = "github:micarmst/vim-spellsync";
    flake = false;
  };

  inputs.vim-startuptime-src = {
    url = "github:dstein64/vim-startuptime";
    flake = false;
  };

  inputs.vim-surround-src = {
    url = "github:tpope/vim-surround";
    flake = false;
  };

  inputs.vim-tmux-navigator-src = {
    url = "github:christoomey/vim-tmux-navigator";
    flake = false;
  };

  inputs.vim-toml-src = {
    url = "github:cespare/vim-toml";
    flake = false;
  };

  inputs.vim-vinegar-src = {
    url = "github:tpope/vim-vinegar";
    flake = false;
  };

  inputs.vim-vsnip-src = {
    url = "github:hrsh7th/vim-vsnip";
    flake = false;
  };

  inputs.vim-which-key-src = {
    url = "github:liuchengxu/vim-which-key";
    flake = false;
  };

  inputs.zig-vim-src = {
    url = "github:ziglang/zig.vim";
    flake = false;
  };
  ###############################################################################

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , dwm-src
    , dwmblocks-src
    , git-buildpackage-src
    , luaprompt-src
    , mutt-filters-src
    , neomutt-src
    , neovim-src
    , oelint-adv-src
    , oelint-parser-src
    , st-src
    , zls-src

      # tmux plugins
    , tmux-continuum-src
    , tmux-copycat-src
    , tmux-dracula-src
    , tmux-fzf-src
    , tmux-open-src
    , tmux-resurrect-src
    , tmux-sensible-src
    , tmux-sessionist-src
    , tmux-tilish-src
    , tmux-yank-src

      # vim-plugins
    , FTerm-nvim-src
    , FixCursorHold-nvim-src
    , ale-src
    , barbar-nvim-src
    , detectindent-src
    , diffconflicts-src
    , editorconfig-vim-src
    , file-line-src
    , friendly-snippets-src
    , galaxyline-nvim-src
    , gina-vim-src
    , indent-guides-nvim-src
    , neoformat-src
    , nvim-colorizer-lua-src
    , nvim-compe-src
    , nvim-lightbulb-src
    , nvim-lspconfig-src
    , nvim-peekup-src
    , nvim-treesitter-src
    , nvim-treesitter-refactor-src
    , nvim-treesitter-textobjects-src
    , nvim-web-devicons-src
    , papercolor-theme-src
    , plenary-nvim-src
    , popup-nvim-src
    , rust-vim-src
    , tabular-src
    , telescope-nvim-src
    , undotree-src
    , vim-SpellCheck-src
    , vim-better-whitespace-src
    , vim-bitbake-src
    , vim-boxdraw-src
    , vim-commentary-src
    , vim-cool-src
    , vim-dispatch-src
    , vim-enmasse-src
    , vim-go-src
    , vim-ingo-library-src
    , vim-json-src
    , vim-lastplace-src
    , vim-markdown-src
    , vim-nix-src
    , vim-obsession-src
    , vim-pandoc-src
    , vim-pandoc-syntax-src
    , vim-prosession-src
    , vim-repeat-src
    , vim-sensible-src
    , vim-sneak-src
    , vim-spellsync-src
    , vim-startuptime-src
    , vim-surround-src
    , vim-tmux-navigator-src
    , vim-toml-src
    , vim-vinegar-src
    , vim-vsnip-src
    , vim-which-key-src
    , zig-vim-src

    }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      callPackage = nixpkgs.legacyPackages.${system}.callPackage;
      recurseIntoAttrs = nixpkgs.legacyPackages.${system}.recurseIntoAttrs;

      tmux-plugin-sources = {
        inherit tmux-continuum-src tmux-copycat-src tmux-dracula-src tmux-fzf-src tmux-open-src tmux-resurrect-src tmux-sensible-src tmux-sessionist-src tmux-tilish-src tmux-yank-src vim-tmux-navigator-src;
      };
      vim-plugin-sources = {
        inherit FTerm-nvim-src FixCursorHold-nvim-src ale-src barbar-nvim-src detectindent-src diffconflicts-src editorconfig-vim-src file-line-src friendly-snippets-src galaxyline-nvim-src gina-vim-src indent-guides-nvim-src neoformat-src nvim-colorizer-lua-src nvim-compe-src nvim-lightbulb-src nvim-lspconfig-src nvim-peekup-src nvim-treesitter-src nvim-treesitter-refactor-src nvim-treesitter-textobjects-src nvim-web-devicons-src papercolor-theme-src plenary-nvim-src popup-nvim-src rust-vim-src tabular-src telescope-nvim-src undotree-src vim-SpellCheck-src vim-better-whitespace-src vim-bitbake-src vim-boxdraw-src vim-commentary-src vim-cool-src vim-dispatch-src vim-enmasse-src vim-go-src vim-ingo-library-src vim-json-src vim-lastplace-src vim-markdown-src vim-nix-src vim-obsession-src vim-pandoc-src vim-pandoc-syntax-src vim-prosession-src vim-repeat-src vim-sensible-src vim-sneak-src vim-spellsync-src vim-startuptime-src vim-surround-src vim-tmux-navigator-src vim-toml-src vim-vinegar-src vim-vsnip-src vim-which-key-src zig-vim-src;
      };

    in
    rec {

      # we have to use legacyPackages for sets of derivations (trees)
      # the package names generated by flattenTree cause issues when using them,
      # so they are re-exported here
      # https://github.com/numtide/flake-utils/pull/29#issuecomment-817652939
      legacyPackages = {
        vim-plugins-custom =
          recurseIntoAttrs (callPackage ./pkgs/vim-plugins-custom { sources = vim-plugin-sources; });
        tmux-plugins-custom = callPackage ./pkgs/tmux-plugins-custom { sources = tmux-plugin-sources; };
      };

      packages = flake-utils.lib.flattenTree rec {
        inherit (legacyPackages) vim-plugins-custom tmux-plugins-custom;

        afew = callPackage ./pkgs/afew { };
        cpio = callPackage ./pkgs/cpio { };
        dwm = callPackage ./pkgs/dwm { src = dwm-src; };
        dwmblocks = callPackage ./pkgs/dwmblocks { src = dwmblocks-src; };
        git-buildpackage = callPackage ./pkgs/git-buildpackage { src = git-buildpackage-src; };
        luaprompt = callPackage ./pkgs/luaprompt { src = luaprompt-src; };
        neomutt-nightly =
          callPackage ./pkgs/neomutt-nightly { src = neomutt-src; };
        neovim-nightly-unwrapped =
          callPackage ./pkgs/neovim-nightly/unwrapped.nix {
            src = neovim-src;
          };
        python3-oelint-parser = callPackage ./pkgs/python3-oelint-parser { src = oelint-parser-src; };
        oelint-adv = callPackage ./pkgs/oelint-adv {
          inherit python3-oelint-parser;
          src = oelint-adv-src;
        };
        st = callPackage ./pkgs/st { src = st-src; };
        vcalendar-filter =
          callPackage ./pkgs/vcalendar-filter { src = mutt-filters-src; };
        zig-nightly = callPackage ./pkgs/zig-nightly { };
        zls = callPackage ./pkgs/zls {
          src = zls-src;
          zig = zig-nightly;
        };
        zzz = callPackage ./pkgs/zzz { };
      };

      defaultPackage = packages.luaprompt;

    });
}
