final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "44b88d8c310e778c55ef1f7a270d2651266054ca";
    sha256 = "1gwf0iiswrw6sx2i0cjwabcyqf3ipgvxm639d0cmn4w0ka4rxzwy";
    fetchSubmodules = true;
  };

})
