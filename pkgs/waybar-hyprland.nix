final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-03-07";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "823c13a8c0a0597e9a58a549f06c37e7037cd832";
    sha256 = "09b9k2d00wb1a5z09i30qwqd2k21dmc9fg5zzqpi6h10jzb6y5l7";
  };

  mesonFlags = old.mesonFlags ++ [
    "-Dmpris=disabled"
    "-Dexperimental=true"
  ];

  # see https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=waybar-hyprland-git
  postPatch = ''
    sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp # use hyprctl to switch workspaces
  '';

})
