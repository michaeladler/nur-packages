final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f2695919bbc4ffea894a54c1d48632ebf0d543a9";
    sha256 = "1np6qx3d75dk1nx5kplph9bvwmawjxsav9fs7z27fyyrc0ka2icn";
    fetchSubmodules = true;
  };

})
