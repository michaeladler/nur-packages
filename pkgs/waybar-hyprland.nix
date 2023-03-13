final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-03-13";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "473eb0982bc7e0c8f5275079b5c79720d5083711";
    sha256 = "1k1lsxndl47sssjcql39bwg31m72sgm8p3z6hmkx6ilyazfyh61i";
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
