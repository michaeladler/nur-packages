final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ed27f0e93e177ffca1def9c64fdfc8c390a2dadd";
    sha256 = "17cfkjbg2lblgvlfrk02il969rd2ixpnmp87wf82jmka6hvhd7gc";
    fetchSubmodules = true;
  };

})
