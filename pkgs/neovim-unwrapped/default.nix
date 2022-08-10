final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bebfbfab3bca1808678bb196904b7570d6806458";
    sha256 = "1qmv84nx3548knlfqc9050vp8gykqrnaqdjwfhbhpgz0g6f46g9z";
    fetchSubmodules = true;
  };

})
