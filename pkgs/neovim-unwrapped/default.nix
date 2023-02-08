final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "81c5483dcb6a5504911b54227923da5028023a7c";
    sha256 = "18q9cyxfd3maf45b0xhdh995n042icnnk979fzw4xv21kimmpqjf";
    fetchSubmodules = true;
  };

})
