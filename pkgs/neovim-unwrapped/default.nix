final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fe159d23fdcc0e93d454bdfdb80e05e2941d7f07";
    sha256 = "1c3h51n0rpi29acdrbkr8afxw5680h10yw68l7r95hn1a328mj9d";
    fetchSubmodules = true;
  };

})
