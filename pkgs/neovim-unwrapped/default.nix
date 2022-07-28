final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f1c01e5f94fa5a41de1805e38427dd7b35506352";
    sha256 = "0njfhyiigrq4cmbbq2mgvyfsl4mw05qsxn8na5rjxpi1pbfa14d2";
    fetchSubmodules = true;
  };

})
