final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "568737d5b39a4b58cab05d4edc2599653979770c";
    sha256 = "058k9pivl451gqw6nac1pjc75wprgyky3n7klxw9gapv4kmyxj84";
    fetchSubmodules = true;
  };

})
