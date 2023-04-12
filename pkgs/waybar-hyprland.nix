final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-04-11";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "a46b8a010963b83f93a00bde0a8394ef2c3070a9";
    sha256 = "01iszwrgyah6y6cpglsr97xvlbkv8biczps0d48abzkamdwfndh4";
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
