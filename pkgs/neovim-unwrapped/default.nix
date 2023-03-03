final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5311c9048a638fecdc066810bb68b60c3048e326";
    sha256 = "0152c3nl5ykiijkzgz11zj2hk1w2ld5zzbvprqnx0kh24q29s6hy";
    fetchSubmodules = true;
  };

})
