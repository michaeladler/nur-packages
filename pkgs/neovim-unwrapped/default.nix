final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "75ec1b7208d4d8f38dff2adf4006de7ea82118d7";
    sha256 = "13z1az5sgxz4smhjq0a72x7vglnab0ri9rh45bdd3aipz42pphwd";
    fetchSubmodules = true;
  };

})
