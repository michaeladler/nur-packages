final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5eb5f4948826e9d47685ea9e257409cc3e693614";
    sha256 = "01dj53xh0wg6v33p00b84v8vgg6m6axlz0hck8cz8drnhamljzgg";
    fetchSubmodules = true;
  };

})
