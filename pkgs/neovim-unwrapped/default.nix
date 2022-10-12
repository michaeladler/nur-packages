final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "eeeb6c80d8f32efee8d13ec4a56a7d487a28eba0";
    sha256 = "084blvfymrhavw081nm0p9kvrrkf3g41lqhygwgl0ahs7pmv0qln";
    fetchSubmodules = true;
  };

})
