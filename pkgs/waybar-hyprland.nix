final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-01-27";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "0ecfce9c61f0deb2583b482f7e222c239bb92372";
    sha256 = "1xyaa5n3drczj2ipmsp3cwflqpk7zjcx0g15gnq34r3dk4ha6k00";
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
