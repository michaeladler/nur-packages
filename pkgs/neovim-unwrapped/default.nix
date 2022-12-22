final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "39ea662824f6b6e7ff1eaee5e2a169ffe535a244";
    sha256 = "12l3kf2xkqf1694wq5d8kyljf0sbpyx3chxjw05yva2dkag5y1m5";
    fetchSubmodules = true;
  };

})
