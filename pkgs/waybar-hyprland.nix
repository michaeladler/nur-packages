final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-01-25";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "47cdd6f98870a713d6e1e293d71b0ee7dc05b55a";
    sha256 = "1lz38fn809byxa0xsn9m12snzpx951jik8bdahk01h20vjrw9dv0";
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
