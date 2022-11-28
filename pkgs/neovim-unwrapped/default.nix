final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a6f0444ab9b5d8947ff7e48718a6b3a484a096fa";
    sha256 = "09wxg0220232bvkww89a6kn55shari911lxkpvx8gp1y1jdckwpg";
    fetchSubmodules = true;
  };

})
