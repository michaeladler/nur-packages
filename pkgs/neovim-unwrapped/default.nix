final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f32fd19f1eedbd75e6a37b73f28cf8761e0e875c";
    sha256 = "1v6yqr5c6cyl01lyqj0lqv5fnsqwzk6df1zn8khgcw9p7p3jjjl2";
    fetchSubmodules = true;
  };

})
