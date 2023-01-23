final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-01-23";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "fea7ec9133a80535447df887077bcbe9379929ce";
    sha256 = "0qp1sfmnc4ixzknfjcagxj3rxf2v3vnyzhl39r7bzyrr9ka17ihh";
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
