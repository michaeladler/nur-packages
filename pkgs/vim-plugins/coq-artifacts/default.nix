{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-19";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "8ae3960b29235d0c8528bf6722947053edbd3604"; # artifacts
    sha256 = "0bk32gm7pzswmqfga1y39gvsk5rdcnm04rcyj9i5fjw842j4bif2";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
