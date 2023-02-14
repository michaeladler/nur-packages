final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "20c9f4b3521fa7ab5c5997c0ec1a3df2b5bd0dbe";
    sha256 = "15cyi983vzrr9i7036rwjl0brbljq07g76ll68h76p199vic1zky";
    fetchSubmodules = true;
  };

})
