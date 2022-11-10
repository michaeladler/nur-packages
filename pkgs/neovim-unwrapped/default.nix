final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "0faf007a236c9b51f151790f79ee59366b501c55";
    sha256 = "10yd51ih0h5yvcad7s5fldhx7bhcjaxp4ga2221wqf2q4r75sw02";
    fetchSubmodules = true;
  };

})
