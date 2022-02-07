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
  neomutt = (import ./pkgs/neomutt) final prev;
  polybar = prev.polybar.override {
    pulseSupport = true;
    i3GapsSupport = true;
  };
  ccls = (import ./pkgs/ccls) final prev;
  neovim-unwrapped = (import ./pkgs/neovim-unwrapped) final prev;
  fmt_8 = (import ./pkgs/fmt/fmt_8.nix) final prev;

  # more up-to-date
  brave = callPackage ./pkgs/brave { };
  pandoc = callPackage ./pkgs/pandoc { };

  # missing upstream
  aoc-cli = callPackage ./pkgs/aoc-cli { };
  btrfs-du = callPackage ./pkgs/btrfs-du { };
  btrfs-list = callPackage ./pkgs/btrfs-list { };
  cinclude2dot = callPackage ./pkgs/cinclude2dot { };
  clang-format-diff = callPackage ./pkgs/clang-format-diff { };
  dotdrop = callPackage ./pkgs/dotdrop { };
  efibootguard = callPackage ./pkgs/efibootguard { };
  fstabfmt = callPackage ./pkgs/fstabfmt { };
  fzy-lua-native = callPackage ./pkgs/fzy-lua-native { };
  git-hours = callPackage ./pkgs/git-hours { };
  go-crx3 = callPackage ./pkgs/go-crx3 { };
  go-mod-outdated = callPackage ./pkgs/go-mod-outdated { };
  leakdice = callPackage ./pkgs/leakdice { };
  libubootenv = callPackage ./pkgs/libubootenv { };
  luaprompt = callPackage ./pkgs/luaprompt { };
  oelint-adv = callPackage ./pkgs/oelint-adv { };
  peda = callPackage ./pkgs/peda { };
  qmarkdown = callPackage ./pkgs/qmarkdown { };
  sscep = callPackage ./pkgs/sscep { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  kas-container = callPackage ./pkgs/kas-container { };
  fmtlog = callPackage ./pkgs/fmtlog { };
  sbkeys = callPackage ./pkgs/sbkeys { };
}
