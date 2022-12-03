final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "10c50d9f30138e7811789ba1c62f4c520cf04c8f";
    sha256 = "10x19hkzfabl8xwv6dg30vajvv8x2zg9gnhl9n2clqc7ik0gicrd";
    fetchSubmodules = true;
  };

})
