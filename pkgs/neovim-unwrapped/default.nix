final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "0fdf59ac9d30d8874ba6eba22a8bdfb41c1603b7";
    sha256 = "0smz5mpvjy66lsfs0dqr9qz7s7h7xppvygcbjyxzzfp8nhwhcl4g";
    fetchSubmodules = true;
  };

})
