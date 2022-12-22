final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5d5fa886fff58bc4246501fbaaf7f63a72c0f0fe";
    sha256 = "0a1pyngcsnmylyf9dhgq64cdzj9dx642yd2kv9qgmh8rpvh9blhw";
    fetchSubmodules = true;
  };

})
