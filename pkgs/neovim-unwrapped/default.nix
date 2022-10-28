final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d9dce2d955b0359d1555bfa86aa641f26ad6e8bc";
    sha256 = "19v0zml20l5qaqvizgs4jqsn63rzg57mqvmpl97bb5nk6sdbpxz6";
    fetchSubmodules = true;
  };

})
