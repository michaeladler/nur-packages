final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-03-02";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "b34d325a7114a0f84154d904a5c349b2006647f9";
    sha256 = "1p2h6zlzhmlcpsjny5b43dpvirfwm11rxm5z2nkg3l0037kqzhr0";
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
