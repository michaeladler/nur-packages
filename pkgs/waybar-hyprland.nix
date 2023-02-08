final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-02-08";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "d25930793c01f4372132720bba6a9db84decba16";
    sha256 = "0mzfwlxcpazqjs003qv5yawd1ph9vk8z5ybf6r7mbxxwy7gh3h7y";
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
