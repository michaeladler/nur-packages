final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-01-24";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "dd9e3d017251f2f88c6bce39d6b3694fbd34d19a";
    sha256 = "040i4fnp992rhbsxdkyiihdriv6m2h3l2prp266kj6m6d94qyq1v";
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
