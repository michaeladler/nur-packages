final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "39d51c833aed7e2ab946cd51bfff8d981269a8ef";
    sha256 = "1j9wsgbkjx5jayrwb1x949380gl6xhzcvxxjqmbjjr82ahqc59vd";
    fetchSubmodules = true;
  };

})
