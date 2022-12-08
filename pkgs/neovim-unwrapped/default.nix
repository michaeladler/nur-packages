final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9b2c79034416c9a1b105f796b761a0d4a2a06ea1";
    sha256 = "1h05y6kc1is77hhqbi5m1969psn9nqpidyfa4yyxnq4xpids9yz6";
    fetchSubmodules = true;
  };

})
