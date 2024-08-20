final: prev:

let
  callPackage = final.callPackage;
in

# do not make this 'rec'
{
  # missing upstream
  asciinema-edit = callPackage ../pkgs/asciinema-edit { };
  atool2 = callPackage ../pkgs/atool2 { };
  bed = callPackage ../pkgs/bed { };
  btrfs-du = callPackage ../pkgs/btrfs-du { };
  btrfs-list = callPackage ../pkgs/btrfs-list { };
  cinclude2dot = callPackage ../pkgs/cinclude2dot { };
  clang-format-diff = callPackage ../pkgs/clang-format-diff { };
  colorized-logs = callPackage ../pkgs/colorized-logs { };
  demo-magic = callPackage ../pkgs/demo-magic { };
  efibootguard = callPackage ../pkgs/efibootguard { };
  extension-downloader = callPackage ../pkgs/extension-downloader { };
  fmtlog = callPackage ../pkgs/fmtlog { };
  fzy-lua-native = callPackage ../pkgs/fzy-lua-native { };
  git-buildpackage = callPackage ../pkgs/git-buildpackage { };
  go-crx3 = callPackage ../pkgs/go-crx3 { };
  go-mod-outdated = callPackage ../pkgs/go-mod-outdated { };
  kas-container = callPackage ../pkgs/kas-container { };
  libubootenv = callPackage ../pkgs/libubootenv { };
  luaprompt = callPackage ../pkgs/luaprompt { };
  notmuch-mailmover = callPackage ../pkgs/notmuch-mailmover { };
  poop = callPackage ../pkgs/poop { };
  qmarkdown = callPackage ../pkgs/qmarkdown { };
  skipcpio = callPackage ../pkgs/skipcpio { };
  vcalendar-filter = callPackage ../pkgs/vcalendar-filter { };
}
