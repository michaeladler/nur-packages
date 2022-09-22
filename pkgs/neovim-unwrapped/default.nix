final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8d13b08a03c31cdb269b7d09c166e0b447f2a303";
    sha256 = "1mxm9xydvrnbqf8815jryl367pddss2619888209782b6dhv4rdl";
    fetchSubmodules = true;
  };

})
