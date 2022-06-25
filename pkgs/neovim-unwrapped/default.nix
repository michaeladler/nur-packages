final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "35e89bf9036b755ae14ee87712faf005886f04f0";
    sha256 = "1g714j3yr2k0xmbjr8snl2kd2pzkj7dsp0wbvd6lf1whap1ri693";
    fetchSubmodules = true;
  };

})
