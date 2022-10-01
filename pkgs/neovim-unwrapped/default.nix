final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-01";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a5e347ce1df65be37c56e84c2a243eeaeaeeea5f";
    sha256 = "0m5cwycdgk4157pw7i5kx0z5j6b8sb7bhn1a9xv1s386hn8g4mdd";
    fetchSubmodules = true;
  };

})
