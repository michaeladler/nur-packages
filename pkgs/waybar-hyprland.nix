final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-01-13";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "6c8e1865865db1eec32e20dd6b8cd6c5dfe11451";
    sha256 = "1md5zjwfspn6kgrjjsxg8844fa6phcqisw9m7yhjkzbya1768l85";
  };

  mesonFlags = old.mesonFlags ++ [
    "-Dmpris=disabled"
  ];

  # see https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=waybar-hyprland-git
  postPatch = ''
    sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp # use hyprctl to switch workspaces
  '';

})
