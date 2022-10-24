final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "40791f8e8239dcb4dda1c4d61e2aa9088e75bb17";
    sha256 = "02m6bjdndh1kb8rw14dvcpmwisg4cb27a7ndph3az5c2x25b6w4n";
    fetchSubmodules = true;
  };

})
