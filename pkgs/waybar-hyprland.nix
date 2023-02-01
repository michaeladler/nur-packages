final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-02-01";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "8da5425189d52ebbaab063c9289c5de5adbe0ca5";
    sha256 = "0c55lpkxs7bfwhp6cgd8y9ci27r5y1drx0g3sj1lm16jn2dcvhrq";
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
