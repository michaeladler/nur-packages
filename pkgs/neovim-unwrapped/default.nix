final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "126ef65e5b3ff0da68bfe166be0bb0a33664142b";
    sha256 = "1fihjq0zgnbgfarcvj07rwzbczm0mpsn2afmyfbw47bai522g6l7";
    fetchSubmodules = true;
  };

})
