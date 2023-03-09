final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-03-08";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "9a0dbd555d4e425616c51887ea3509c1146eca39";
    sha256 = "08vpwylzz7q72z00gf4qmswrmbrqpl540ff6wy98rhbrvgdsi9q0";
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
