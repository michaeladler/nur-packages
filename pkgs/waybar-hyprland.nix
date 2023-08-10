final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-08-09";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "b084bf721e921f3bac3e8ca10f9d9ab8e0f7dcc7";
    sha256 = "16w2vlr8p57pm2ij1fcq86988w4hqm2k95gfh9k5295jgnhnrxii";
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
