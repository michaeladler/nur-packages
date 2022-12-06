final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6d7b94ea086e17d16e2490e56572f17031924af5";
    sha256 = "0gbfhd6aiqwpwba7jc4vgcpkd80ln9xhn9ixq6a5g00p8nsmq3cf";
    fetchSubmodules = true;
  };

})
