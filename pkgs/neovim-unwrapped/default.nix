final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a505c1acc37b0f9d4f7d93bfe899a59514bd0027";
    sha256 = "1wfmy37nlfvyb33xj14wrd0hjc7zvap4hcv9cd8817v49hq4xcwm";
    fetchSubmodules = true;
  };

})
