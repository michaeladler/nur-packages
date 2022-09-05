final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-04";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5ac6654334785427886d5698fdbe79577c8c6efe";
    sha256 = "10nbbanqnr0a5x8xjs48afqgkhlpxs9gl1ry7pry0mbznapdsmzc";
    fetchSubmodules = true;
  };

})
