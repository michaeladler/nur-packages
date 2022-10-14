final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d339b4aad7461937e1e03ac0836b2eb1354ff442";
    sha256 = "041msq8y6agd7y6rq6yhp7cz98iq8bj1imlzkm9kiss3a3z8zqmz";
    fetchSubmodules = true;
  };

})
