final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = final.callPackage;
in

{
  # overlayed
  brave = (import ./pkgs/brave) final prev;
  dwm = (import ./pkgs/dwm) final prev;
  dwmblocks = (import ./pkgs/dwmblocks) final prev;
  firefox-bin-unwrapped = (import ./pkgs/firefox-bin-unwrapped) final prev;
  handlr = (import ./pkgs/handlr) final prev;
  nix-direnv = (import ./pkgs/nix-direnv) final prev;
  zig = (import ./pkgs/zig) final prev;
  zls = (import ./pkgs/zls) final prev;

  # missing upstream
  btrfs-du = callPackage ./pkgs/btrfs-du { };
  btrfs-list = callPackage ./pkgs/btrfs-list { };
  fstabfmt = callPackage ./pkgs/fstabfmt { };
  git-hours = callPackage ./pkgs/git-hours { };
  go-crx3 = callPackage ./pkgs/go-crx3 { };
  go-mod-outdated = callPackage ./pkgs/go-mod-outdated { };
  goofys = callPackage ./pkgs/goofys { };
  luaprompt = callPackage ./pkgs/luaprompt { };
  minigbm = callPackage ./pkgs/minigbm { };
  msktutil = callPackage ./pkgs/msktutil { };
  oelint-adv = callPackage ./pkgs/oelint-adv { };
  peda = callPackage ./pkgs/peda { };
  qmarkdown = callPackage ./pkgs/qmarkdown { };
  sscep = callPackage ./pkgs/sscep { };
  ungoogled-chromium-bin = callPackage ./pkgs/ungoogled-chromium-bin { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  xplugd = callPackage ./pkgs/xplugd { };

  # bundles

  myTmuxPlugins = prev.recurseIntoAttrs ((import ./pkgs/tmux-plugins) final prev);
  tmuxPlugins = prev.tmuxPlugins // final.myTmuxPlugins;

  myVimPlugins = prev.recurseIntoAttrs ((import ./pkgs/vim-plugins) final prev);
  vimPlugins = prev.vimPlugins // final.myVimPlugins;

  myZshPlugins = prev.recurseIntoAttrs ((import ./pkgs/zsh-plugins/overlay.nix) final prev);
  zshPlugins = (prev.zshPlugins  or { }) // final.myZshPlugins;

  firefoxAddons = prev.recurseIntoAttrs ((import ./pkgs/firefox-addons) final prev);
}
