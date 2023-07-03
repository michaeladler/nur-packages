final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-07-02";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "91588fb8bb77f840e34c4f7b57df6b961b8592b9";
    sha256 = "0x4qvj81lrqzjvfkzf2r4sv1nclmkcka3ynsx5lz53apl8vaw1cf";
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
