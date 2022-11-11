final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "69507c0204cfe284e42865c9c89baec0f351b2c1";
    sha256 = "1df8ca4ppcp890w5b29v8dbjkkw0gk0f8bh4s4rszsgy4vzbqs86";
    fetchSubmodules = true;
  };

})
