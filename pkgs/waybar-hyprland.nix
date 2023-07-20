final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-07-19";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "430f0e5d654de8b538fafb9f619511b1ae8c84b2";
    sha256 = "061nggq3pspf9jy1q19ai7hbfbf4y2xpmhwx5smh915cc9zv2gvx";
  };

  mesonFlags = old.mesonFlags ++ [
    "-Dmpris=disabled"
    "-Dcava=disabled"
    "-Dexperimental=true"
  ];

  # see https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=waybar-hyprland-git
  postPatch = ''
    sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp # use hyprctl to switch workspaces
  '';

})
