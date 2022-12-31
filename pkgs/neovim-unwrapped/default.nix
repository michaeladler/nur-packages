final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-31";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6ba34e21fee2a81677e8261dfeaf24c8cd320500";
    sha256 = "0dl1skjfhh2njlkw4h2m1rvxg455rn0hxnck44lsgv51znl6sswv";
    fetchSubmodules = true;
  };

})
