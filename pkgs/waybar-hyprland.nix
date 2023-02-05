final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-02-04";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "48312f4c9139c4d5fb546c2984f631fd5b4a524e";
    sha256 = "1w97n7fckdmzb9n22rb9f2igjyaf021jxk1d6dljzmkzb2sy9150";
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
