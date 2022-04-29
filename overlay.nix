final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = final.callPackage;
in

rec {
  # overlays
  firefox-bin-unwrapped = (import ./pkgs/firefox-bin-unwrapped) final prev;
  handlr = (import ./pkgs/handlr) final prev;
  i3-gaps = (import ./pkgs/i3-gaps) final prev;
  nix-direnv = (import ./pkgs/nix-direnv) final prev;
  zig-master = (import ./pkgs/zig) final prev;
  zls = (import ./pkgs/zls) final prev;
  neomutt = (import ./pkgs/neomutt) final prev;
  polybar = prev.polybar.override {
    pulseSupport = true;
    i3GapsSupport = true;
  };
  ccls = (import ./pkgs/ccls) final prev;
  neovim-unwrapped = (import ./pkgs/neovim-unwrapped) final prev;
  fmt_8 = (import ./pkgs/fmt/fmt_8.nix) final prev;
  sumneko-lua-language-server = (import ./pkgs/sumneko-lua-language-server) final prev;

  # more up-to-date
  brave = callPackage ./pkgs/brave { };
  pandoc = callPackage ./pkgs/pandoc { };
  awesome-git = callPackage ./pkgs/awesome (with final; {
    lua = luajit;
    cairo = cairo.override { xcbSupport = true; };
    inherit (texFunctions) fontsConf;
  });

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
  peda = callPackage ./pkgs/peda { };
  qmarkdown = callPackage ./pkgs/qmarkdown { };
  sscep = callPackage ./pkgs/sscep { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  kas-container = callPackage ./pkgs/kas-container { };
  fmtlog = callPackage ./pkgs/fmtlog { };
  sbkeys = callPackage ./pkgs/sbkeys { };
  chyle = callPackage ./pkgs/chyle { };

  myluapackages = lua: rec {
    lua-getch = callPackage ./pkgs/lua-packages/lua-getch.nix { inherit lua; };
    dbus_proxy = callPackage ./pkgs/lua-packages/dbus_proxy.nix { inherit lua; };
    pulseaudio_dbus = callPackage ./pkgs/lua-packages/pulseaudio_dbus.nix { inherit lua dbus_proxy; };
  };

  luajitPackages = prev.luajitPackages // (myluapackages prev.luajit);
}
