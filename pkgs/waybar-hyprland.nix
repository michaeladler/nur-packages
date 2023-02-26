final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-02-25";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "09142fa322e080474de0f2dc3ea98036846550df";
    sha256 = "1dagxnic5ljry8mg7gvyfrpk8i85586ijmmmzq2mwnxhl9lr1ap4";
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
