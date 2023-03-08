final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e0e474a4bb42c24cf13662135f53a164a826f48e";
    sha256 = "1cwbcw7ndp0nrjywvpxpzw0q3pqdxrxw0hcznb81vbmixzlvjn80";
    fetchSubmodules = true;
  };

})
