final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5dc4eaf386d70b9bbef321a00bcbb5d475f36542";
    sha256 = "04ll0fx3v2gp5xhap0dnvnffahncli8nglj1k33sr9p7vn24abfn";
    fetchSubmodules = true;
  };

})
