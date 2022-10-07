final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "cfdb4cbada8c65aa57e69776bcc0f7b8b298317a";
    sha256 = "0zsqg4zc4v8iygcdmpbyjnqzs36d0a0pmzvkk8nqiqsp94rrclm1";
    fetchSubmodules = true;
  };

})
