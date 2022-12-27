final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d215dae0e0908d464d70e5645f3e2690bd9caf60";
    sha256 = "0apbh5bvad85g8by3imj7ah3qdrifnrmv0kg7x0qmsjvxjb812lk";
    fetchSubmodules = true;
  };

})
