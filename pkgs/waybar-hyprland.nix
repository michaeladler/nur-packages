final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-01-17";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "eb9d2d9c5d55ceba74ab423b2a7d461427c6c38d";
    sha256 = "1zpcim82fiiwzziivgf68bh23m981p7fzrhpw4gp7k345qm2h26z";
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
