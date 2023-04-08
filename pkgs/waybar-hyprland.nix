final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-04-06";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "bd908f6d9750209baffe1ce9d43006130a26c4ed";
    sha256 = "0mbk797ncxq66m4vx8ghxpppy7n30shgx095w89c7gs8zjk5rlh5";
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
