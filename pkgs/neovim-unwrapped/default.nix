final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9b4cab012662514af6fda3648d544633e1d73d4b";
    sha256 = "1w98b8h9x13pn0f3gr9l654xngndrpr2a85pdjk9bffqffjq9i9z";
    fetchSubmodules = true;
  };

})
