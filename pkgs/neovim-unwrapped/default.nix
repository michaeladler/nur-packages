final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1d8b77da6b0abe6dccd6ce64e283b7208f873d57";
    sha256 = "0n1yc8kli2cy7xgz98rjja9m9bpvlmf2clqyfyhkl9bpas4b108l";
    fetchSubmodules = true;
  };

})
