final: prev:

let
  callPackage = final.callPackage;
in

# do not make this 'rec'
{
  # customized
  aerc = (import ../pkgs/aerc) final prev;
  kanshi = (import ../pkgs/kanshi) final prev;

  # missing upstream
  asciinema-edit = callPackage ../pkgs/asciinema-edit { };
  bed = callPackage ../pkgs/bed { };
  btrfs-list = callPackage ../pkgs/btrfs-list { };
  cinclude2dot = callPackage ../pkgs/cinclude2dot { };
  colorized-logs = callPackage ../pkgs/colorized-logs { };
  demo-magic = callPackage ../pkgs/demo-magic { };
  efibootguard = callPackage ../pkgs/efibootguard { };
  extension-downloader = callPackage ../pkgs/extension-downloader { };
  go-mod-outdated = callPackage ../pkgs/go-mod-outdated { };
  kas-container = callPackage ../pkgs/kas-container { };
  libubootenv = callPackage ../pkgs/libubootenv { };
  notmuch-mailmover = callPackage ../pkgs/notmuch-mailmover { };
  river-bsp-layout = callPackage ../pkgs/river-bsp-layout { };
  skipcpio = callPackage ../pkgs/skipcpio { };
  vcalendar-filter = callPackage ../pkgs/vcalendar-filter { };
}
