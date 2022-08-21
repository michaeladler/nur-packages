final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "741ef87876d86ef7c6f64297a47aba15613e78da";
    sha256 = "1j4idp21hw8k0gl21ikdiqmmlpym0bxcrribzvqngkxc173m1551";
    fetchSubmodules = true;
  };

})
