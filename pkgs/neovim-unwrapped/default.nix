final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-31";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9511faa819e8260aa7ae2c2ff140070bbc96efa9";
    sha256 = "0krh4gs2iqm9bm21x10d9pjmiw0n8i0hq2l6mvjnqmwq2h1dr6ql";
    fetchSubmodules = true;
  };

})
