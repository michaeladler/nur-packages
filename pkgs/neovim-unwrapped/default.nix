final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3cc8559963a7c7b6ce9a914a1ca3de0b9869d931";
    sha256 = "18fqhhrn4pma6nh6fga53z0zqg8n4s2bf3m6qw1xavrhqbbd2yya";
    fetchSubmodules = true;
  };

})
