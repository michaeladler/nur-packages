final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = final.callPackage;
in

{
  zsh-autosuggestions = (import ./pkgs/zsh-plugins/zsh-autosuggestions) final prev;
  zsh-fast-syntax-highlighting = (import ./pkgs/zsh-plugins/zsh-fast-syntax-highlighting) final prev;
  zsh-pandoc-completion = callPackage ./pkgs/zsh-plugins/zsh-pandoc-completion { };
  zsh-vi-mode = callPackage ./pkgs/zsh-plugins/zsh-vi-mode { };

  zig = (import ./pkgs/zig) final prev;
  zls = (import ./pkgs/zls) final prev;

  dwm = (import ./pkgs/dwm) final prev;
  dwmblocks = (import ./pkgs/dwmblocks) final prev;

  brave = (import ./pkgs/brave) final prev;

  luaprompt = callPackage ./pkgs/luaprompt { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  oelint-adv = callPackage ./pkgs/oelint-adv { };
  fstabfmt = callPackage ./pkgs/fstabfmt { };
  goofys = callPackage ./pkgs/goofys { };
  xplugd = callPackage ./pkgs/xplugd { };
  crx3 = callPackage ./pkgs/crx3 { };
  btrfs-list = callPackage ./pkgs/btrfs-list { };
  btrfs-du = callPackage ./pkgs/btrfs-du { };
  peda = callPackage ./pkgs/peda { };
  qmarkdown = callPackage ./pkgs/qmarkdown { };

  ungoogled-chromium-bin = callPackage ./pkgs/ungoogled-chromium-bin { };
  minigbm = callPackage ./pkgs/minigbm { };

  sscep = callPackage ./pkgs/sscep { };
  msktutil = callPackage ./pkgs/msktutil { };

  nix-direnv = (import ./pkgs/nix-direnv) final prev;

  myTmuxPlugins = prev.recurseIntoAttrs ((import ./pkgs/tmux-plugins) final prev);
  tmuxPlugins = prev.tmuxPlugins // final.myTmuxPlugins;

  myVimPlugins = prev.recurseIntoAttrs ((import ./pkgs/vim-plugins) final prev);
  vimPlugins = prev.vimPlugins // final.myVimPlugins;

  firefox-bin = (import ./pkgs/firefox-bin) final prev;
  firefoxAddons = prev.recurseIntoAttrs ((import ./pkgs/firefox-addons) final prev);

  # my packages
  shell-snoop = callPackage ./pkgs/shell-snoop { };

}
