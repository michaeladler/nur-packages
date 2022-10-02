final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "dd1c613d0b47e818b7a6657f3c4bdeb959199628";
    sha256 = "1zdxm0wmr52kz4k4vpi65a05vgkvacbf43fqklkgyxxq2iv95kg5";
    fetchSubmodules = true;
  };

})
