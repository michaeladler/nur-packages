final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1ef84547a8ed4b237fbfbe673f1e9c4cd863ff0b";
    sha256 = "0cngfwjr4y2fd9srz9g7gkzk1xdcrwglfxi30khv327lcpskfqla";
    fetchSubmodules = true;
  };

})
