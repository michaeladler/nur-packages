final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fcd3e5372027786ffc9ee1ddc986b977650df168";
    sha256 = "0jyz3q93pab7qa4di1kqhnp0r3csqjkx7cza8cpwkh9xi98fy31n";
    fetchSubmodules = true;
  };

})
