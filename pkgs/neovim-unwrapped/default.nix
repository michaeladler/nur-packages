final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-11";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f98cff9575e75a050d2bde01ad950c0c72bcfc3e";
    sha256 = "0m5wx9z6aa2117p68yhkksbfwd41ffh0wxzfqxd4a5c5plz5pbs1";
    fetchSubmodules = true;
  };

})
