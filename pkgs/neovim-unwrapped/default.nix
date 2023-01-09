final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "364b131f42509326c912c9b0fef5dfc94ed23b41";
    sha256 = "19xwr8s9frvx7jqn2qdxpybby503bmk3f7cqax2qdgdlc4w7cpy3";
    fetchSubmodules = true;
  };

})
