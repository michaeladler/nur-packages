final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-05-29";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "47193a3d2f81a8ce7177449f92e927db74d873b0";
    sha256 = "11yia2fs5a05jlbrdhxm26c2sgmbj3iwsk3bsqcvjvv3mlsrhxkf";
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
