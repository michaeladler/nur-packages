final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = final.callPackage;
in

{
  # overlays
  firefox-bin-unwrapped = (import ./pkgs/firefox-bin-unwrapped) final prev;
  handlr = (import ./pkgs/handlr) final prev;
  i3-gaps = (import ./pkgs/i3-gaps) final prev;
  nix-direnv = (import ./pkgs/nix-direnv) final prev;
  zig = (import ./pkgs/zig) final prev;
  zls = (import ./pkgs/zls) final prev;
  neomutt = (import ./pkgs/neomutt) final prev;

  # more up-to-date
  brave = callPackage ./pkgs/brave { };
  dhall = callPackage ./pkgs/dhall { };
  dhall-json = callPackage ./pkgs/dhall-json { };
  dhall-lsp-server = callPackage ./pkgs/dhall-lsp-server { };

  # missing upstream
  btrfs-du = callPackage ./pkgs/btrfs-du { };
  btrfs-list = callPackage ./pkgs/btrfs-list { };
  clang-format-diff = callPackage ./pkgs/clang-format-diff { };
  efibootguard = callPackage ./pkgs/efibootguard { };
  fstabfmt = callPackage ./pkgs/fstabfmt { };
  git-hours = callPackage ./pkgs/git-hours { };
  go-crx3 = callPackage ./pkgs/go-crx3 { };
  go-mod-outdated = callPackage ./pkgs/go-mod-outdated { };
  goofys = callPackage ./pkgs/goofys { };
  leakdice = callPackage ./pkgs/leakdice { };
  libubootenv = callPackage ./pkgs/libubootenv { };
  luaprompt = callPackage ./pkgs/luaprompt { };
  msktutil = callPackage ./pkgs/msktutil { };
  oelint-adv = callPackage ./pkgs/oelint-adv { };
  peda = callPackage ./pkgs/peda { };
  qmarkdown = callPackage ./pkgs/qmarkdown { };
  sscep = callPackage ./pkgs/sscep { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };

  # bundles
  myTmuxPlugins = prev.recurseIntoAttrs ((import ./pkgs/tmux-plugins) final prev);
  tmuxPlugins = prev.tmuxPlugins // final.myTmuxPlugins;

  myVimPlugins = (prev.recurseIntoAttrs ((import ./pkgs/vim-plugins) final prev));
  vimPlugins = prev.vimPlugins // final.myVimPlugins;

  myZshPlugins = prev.recurseIntoAttrs ((import ./pkgs/zsh-plugins/overlay.nix) final prev);
  zshPlugins = (prev.zshPlugins  or { }) // final.myZshPlugins;

  firefoxAddons = prev.recurseIntoAttrs ((import ./pkgs/firefox-addons) final prev);
}
