final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = final.callPackage;
in

# do not make this 'rec'
{

  # overlays
  nix-direnv = (import ./pkgs/nix-direnv) final prev;
  neovim-unwrapped = (import ./pkgs/neovim-unwrapped) final prev;
  sumneko-lua-language-server = (import ./pkgs/sumneko-lua-language-server) final prev;
  zinit = (import ./pkgs/zinit) final prev;
  thinkfan = (import ./pkgs/thinkfan) final prev;
  srandrd = (import ./pkgs/srandrd) final prev;
  waybar-hyprland = (import ./pkgs/waybar-hyprland.nix) final prev;
  git-latest = ((import ./pkgs/git-latest) final prev).override {
    stdenv = final.stdenvAdapters.optimizeX86-64-v3 prev.stdenv;
    sendEmailSupport = true;
    withSsh = true;
    withLibsecret = true;
  };
  brave = (import ./pkgs/brave) final prev;
  golangci-lint = prev.golangci-lint.override {
    buildGoModule = final.buildGo120Module;
  };
  go-tools = prev.go-tools.override {
    buildGoModule = final.buildGo120Module;
  };

  zstd-optimized = prev.zstd.override {
    stdenv = final.stdenvAdapters.optimizeX86-64-v3 prev.stdenv;
  };

  # do not use 'pandoc' as name! otherwise webkitgtk will be rebuilt and this is *very* expensive!
  pandoc-bin = callPackage ./pkgs/pandoc { };
  criterion = callPackage ./pkgs/criterion { };

  # missing upstream
  age-plugin-yubikey = callPackage ./pkgs/age-plugin-yubikey { };
  bed = callPackage ./pkgs/bed { };
  btrfs-du = callPackage ./pkgs/btrfs-du { };
  btrfs-list = callPackage ./pkgs/btrfs-list { };
  chromium-browserpass = callPackage ./pkgs/chromium-browserpass { };
  chromium-floccus = callPackage ./pkgs/chromium-floccus { };
  chyle = callPackage ./pkgs/chyle { };
  cinclude2dot = callPackage ./pkgs/cinclude2dot { };
  clang-format-diff = callPackage ./pkgs/clang-format-diff { };
  czmod = callPackage ./pkgs/czmod { };
  efibootguard = callPackage ./pkgs/efibootguard { };
  fmtlog = callPackage ./pkgs/fmtlog { };
  fzy-lua-native = callPackage ./pkgs/fzy-lua-native { };
  git-hours = callPackage ./pkgs/git-hours { };
  go-crx3 = callPackage ./pkgs/go-crx3 { };
  go-mod-outdated = callPackage ./pkgs/go-mod-outdated { };
  kas-container = callPackage ./pkgs/kas-container { };
  libubootenv = callPackage ./pkgs/libubootenv { };
  luaprompt = callPackage ./pkgs/luaprompt { };
  qmarkdown = callPackage ./pkgs/qmarkdown { };
  sbkeys = callPackage ./pkgs/sbkeys { };
  skipcpio = callPackage ./pkgs/skipcpio { };
  sscep = callPackage ./pkgs/sscep { };
  tlpui = callPackage ./pkgs/tlpui { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  pam-fprint-grosshack = callPackage ./pkgs/pam-fprint-grosshack { };
  git-buildpackage = callPackage ./pkgs/git-buildpackage { };
  chromium-vimium = callPackage ./pkgs/chromium-vimium { };
  chromium-xbrowsersync = callPackage ./pkgs/chromium-xbrowsersync { };
  msktutil = callPackage ./pkgs/msktutil { };
  notmuch-mailmover = callPackage ./pkgs/notmuch-mailmover { };
  clipboard = callPackage ./pkgs/clipboard { };

  extraLuaJITPackages = let lua = prev.luajit; in
    rec {
      lua-getch = callPackage ./pkgs/lua-packages/lua-getch.nix { inherit lua; };
      pulseaudio = callPackage ./pkgs/lua-packages/pulseaudio.nix { inherit lua; };
    };

}
