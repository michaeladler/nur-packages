final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = final.callPackage;
in

{
  neovim-unwrapped = (import ./pkgs/neovim/unwrapped.nix) final prev;

  zsh-autosuggestions = (import ./pkgs/zsh-plugins/zsh-autosuggestions) final prev;
  zsh-fast-syntax-highlighting = (import ./pkgs/zsh-plugins/zsh-fast-syntax-highlighting) final prev;
  zsh-pandoc-completion = callPackage ./pkgs/zsh-plugins/zsh-pandoc-completion { };
  zsh-vi-mode = callPackage ./pkgs/zsh-plugins/zsh-vi-mode { };

  zig = (import ./pkgs/zig) final prev;
  zls = (import ./pkgs/zls) final prev;

  dwm = (import ./pkgs/dwm) final prev;
  dwmblocks = (import ./pkgs/dwmblocks) final prev;
  st = (import ./pkgs/st) final prev;

  luaprompt = callPackage ./pkgs/luaprompt { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  zzz = callPackage ./pkgs/zzz { };
  oelint-adv = callPackage ./pkgs/oelint-adv { };

  afew = (import ./pkgs/afew) final prev;
  nix-direnv = (import ./pkgs/nix-direnv) final prev;

  myTmuxPlugins = callPackage ./pkgs/tmux-plugins { orig = prev.tmuxPlugins; };
  tmuxPlugins = prev.tmuxPlugins // final.myTmuxPlugins;

  myVimPlugins = prev.recurseIntoAttrs (callPackage ./pkgs/vim-plugins { orig = prev.vimPlugins; });
  vimPlugins = prev.vimPlugins // final.myVimPlugins;

}
