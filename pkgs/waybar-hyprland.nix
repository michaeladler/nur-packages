final: prev:

prev.waybar.overrideAttrs (old: {

  version = "unstable-2023-01-30";

  src = final.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "c93811b1588c90bf0137cb741f3f13a3a151c726";
    sha256 = "1a3b8ss5rbaxv7x2q2ksgmfccf6nlp723yf3bpzhcm4zg3v13p13";
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
