final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = final.callPackage;
in

# do not make this 'rec'
{

  # overlays
  nix-direnv = (import ./pkgs/nix-direnv) final prev;
  lua-language-server = (import ./pkgs/lua-language-server) final prev;
  zinit = (import ./pkgs/zinit) final prev;
  thinkfan = (import ./pkgs/thinkfan) final prev;
  srandrd = (import ./pkgs/srandrd) final prev;
  neovim-unwrapped = (import ./pkgs/neovim-unwrapped) final prev;
  golangci-lint = prev.golangci-lint.override {
    buildGoModule = final.buildGo120Module;
  };
  go-tools = prev.go-tools.override {
    buildGoModule = final.buildGo120Module;
  };

  checksec = prev.checksec.overrideAttrs (old: {
    preFixup = ''
      sed -i -e '/# sanitize/I,+1 d' $out/bin/checksec
    '';
  });

  # do not use 'pandoc' as name! otherwise webkitgtk will be rebuilt and this is *very* expensive!
  pandoc-bin = callPackage ./pkgs/pandoc { };
  criterion = callPackage ./pkgs/criterion { };

  # missing upstream
  age-plugin-yubikey = callPackage ./pkgs/age-plugin-yubikey { };
  asciinema-edit = callPackage ./pkgs/asciinema-edit { };
  atool2 = callPackage ./pkgs/atool2 { };
  bed = callPackage ./pkgs/bed { };
  btrfs-du = callPackage ./pkgs/btrfs-du { };
  btrfs-list = callPackage ./pkgs/btrfs-list { };
  chromium-browserpass = callPackage ./pkgs/chromium-browserpass { };
  chromium-floccus = callPackage ./pkgs/chromium-floccus { };
  chromium-vimium = callPackage ./pkgs/chromium-vimium { };
  chromium-xbrowsersync = callPackage ./pkgs/chromium-xbrowsersync { };
  chyle = callPackage ./pkgs/chyle { };
  cinclude2dot = callPackage ./pkgs/cinclude2dot { };
  clang-format-diff = callPackage ./pkgs/clang-format-diff { };
  czmod = callPackage ./pkgs/czmod { };
  demo-magic = callPackage ./pkgs/demo-magic { };
  efibootguard = callPackage ./pkgs/efibootguard { };
  fmtlog = callPackage ./pkgs/fmtlog { };
  fzy-lua-native = callPackage ./pkgs/fzy-lua-native { };
  git-buildpackage = callPackage ./pkgs/git-buildpackage { };
  git-hours = callPackage ./pkgs/git-hours { };
  go-crx3 = callPackage ./pkgs/go-crx3 { };
  go-mod-outdated = callPackage ./pkgs/go-mod-outdated { };
  kas-container = callPackage ./pkgs/kas-container { };
  libubootenv = callPackage ./pkgs/libubootenv { };
  linux-zen = callPackage ./pkgs/linux-zen { };
  linux-lqx = callPackage ./pkgs/linux-lqx { };
  luaprompt = callPackage ./pkgs/luaprompt { };
  msktutil = callPackage ./pkgs/msktutil { };
  notmuch-mailmover = callPackage ./pkgs/notmuch-mailmover { };
  qmarkdown = callPackage ./pkgs/qmarkdown { };
  sbkeys = callPackage ./pkgs/sbkeys { };
  skipcpio = callPackage ./pkgs/skipcpio { };
  sscep = callPackage ./pkgs/sscep { };
  tlpui = callPackage ./pkgs/tlpui { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  colorized-logs = callPackage ./pkgs/colorized-logs { };
  poop = callPackage ./pkgs/poop { };
  gtk-chtheme = callPackage ./pkgs/gtk-chtheme { };

  extraLuaJITPackages = let lua = prev.luajit; in
    rec {
      lua-getch = callPackage ./pkgs/lua-packages/lua-getch.nix { inherit lua; };
      pulseaudio = callPackage ./pkgs/lua-packages/pulseaudio.nix { inherit lua; };
    };

}
