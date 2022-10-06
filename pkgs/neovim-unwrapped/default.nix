final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "25dea99ce54de6a8c4369e28e0db82e1af669f24";
    sha256 = "0bagr1kjlswg8fpp3vy2hrnng7ayysylf1xz854fly75mbv7zfw9";
    fetchSubmodules = true;
  };

})
