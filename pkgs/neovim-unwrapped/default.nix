final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f479dd0bbef9383df05b1908eec0013ba92499b5";
    sha256 = "0c296l8ha2r2f11m6jls4dzwzsdrw4gf03l623sxfdgbmfm9wj04";
    fetchSubmodules = true;
  };

})
