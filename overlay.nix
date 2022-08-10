final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = final.callPackage;
in

# do not make this 'rec'
{

  # overlays
  awesome-git = (import ./pkgs/awesome) final prev;
  firefox-bin-unwrapped = (import ./pkgs/firefox-bin-unwrapped) final prev;
  handlr = (import ./pkgs/handlr) final prev;
  i3-gaps = (import ./pkgs/i3-gaps) final prev;
  nix-direnv = (import ./pkgs/nix-direnv) final prev;
  zig-master = (import ./pkgs/zig) final prev;
  zls = (import ./pkgs/zls) final prev;
  ccls = (import ./pkgs/ccls) final prev;
  neovim-unwrapped = (import ./pkgs/neovim-unwrapped) final prev;
  fmt_8 = (import ./pkgs/fmt/fmt_8.nix) final prev;
  sumneko-lua-language-server = (import ./pkgs/sumneko-lua-language-server) final prev;

  # more up-to-date
  brave = callPackage ./pkgs/brave { };
  # do not use 'pandoc' as name! otherwise webkitgtk will be rebuilt and this is *very* expensive!
  pandoc-bin = callPackage ./pkgs/pandoc { };
  criterion = callPackage ./pkgs/criterion { };

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
  qmarkdown = callPackage ./pkgs/qmarkdown { };
  sscep = callPackage ./pkgs/sscep { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  kas-container = callPackage ./pkgs/kas-container { };
  fmtlog = callPackage ./pkgs/fmtlog { };
  sbkeys = callPackage ./pkgs/sbkeys { };
  chyle = callPackage ./pkgs/chyle { };
  cargo-llvm-cov = callPackage ./pkgs/cargo-llvm-cov { };
  chromium-browserpass = callPackage ./pkgs/chromium-browserpass { };

  extraLuaJITPackages = let lua = prev.luajit; in
    rec {
      lua-getch = callPackage ./pkgs/lua-packages/lua-getch.nix { inherit lua; };
      pulseaudio = callPackage ./pkgs/lua-packages/pulseaudio.nix { inherit lua; };
    };

}
