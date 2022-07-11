final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "95c65a6b221fe6e1cf91e8322e7d7571dc511a71";
    sha256 = "1h4mxgk5mv0qh55zjmyg8xk98g8rw7hzflfg1xw7dnhdiczmyyxn";
    fetchSubmodules = true;
  };

})
