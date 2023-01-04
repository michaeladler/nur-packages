final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-04";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ef18c9f9b05caf1f39ed32762f53802e378f143b";
    sha256 = "15pd29x1178mpc9mf7phraamsh1pgn2vgh46p5vr0lxx7ah0b85i";
    fetchSubmodules = true;
  };

})
