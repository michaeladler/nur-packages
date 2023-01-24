final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-01-23";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "e7af29ac1e2189f3d39d513feb814dab10b86fd7";
    sha256 = "09c70931xlfs1yhx384v3pnlaw9fwarw1ix0rpb1dyq0c0yx9gg7";
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
