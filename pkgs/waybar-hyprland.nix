final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-02-09";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "ea38eec2afd249481df737cc38e055974f83967c";
    sha256 = "0yjizixq0divcxkz2ha6s642iiwsi5wbh81sad9bch7nhxmard8g";
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
