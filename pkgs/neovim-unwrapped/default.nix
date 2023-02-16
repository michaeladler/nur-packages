final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "631775c05d257e5e61af31d20d9fd5be2dba82c2";
    sha256 = "0b2xw8f1wscfs71jaxxaw8hwg9w7l5asf0v7z7wkb6n9bw0kxg07";
    fetchSubmodules = true;
  };

})
