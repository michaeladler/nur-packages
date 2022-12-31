final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-31";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "99cf111289bfcd14981255e805da43bac5139141";
    sha256 = "02ai354ak6vqx04r1r56a7ifyszc5pi541pzwm9gn21iibdi3379";
    fetchSubmodules = true;
  };

})
