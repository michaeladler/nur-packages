final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-04";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b098e7971fdf8ed3f7d0c52aff0ce126c34ff3c8";
    sha256 = "17j5lfpk51y2nq817ygcpwvkpjq7ss42m2aygz2vya5jkj46arxv";
    fetchSubmodules = true;
  };

})
