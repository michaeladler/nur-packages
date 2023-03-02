final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-03-01";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "f29a400c97d6cc339c5be2ca6c5467c04323b766";
    sha256 = "1shbmvk1dz7qxkln64cnl0iwqq64dfcjhz8hal8zb1drb66bj7pd";
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
