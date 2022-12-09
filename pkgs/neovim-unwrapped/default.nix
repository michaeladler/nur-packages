final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3cf0131c5cc6e9d9df0c632646e39301f107e5a8";
    sha256 = "0fx9y175ihvd6y3cv3sc4hziw5fgs4xk247mwf3g4gcd3airszzh";
    fetchSubmodules = true;
  };

})
