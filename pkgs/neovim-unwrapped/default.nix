final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a442c9f5564ff9690803faa92012e35541588294";
    sha256 = "0jnfq6mjqjgf53kdwxvkw0p44pximma7bhy2yxxn679r8xbv0aqz";
    fetchSubmodules = true;
  };

})
