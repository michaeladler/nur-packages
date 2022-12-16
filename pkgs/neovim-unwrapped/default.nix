final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a2bf0cef10926880b28d542887d2d3836e332929";
    sha256 = "1y13chxc93jcrhvmz3r4afpjym7z02f0z6kivdwkxss5y30wgvpg";
    fetchSubmodules = true;
  };

})
