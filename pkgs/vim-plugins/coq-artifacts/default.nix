{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-13";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "3fd26fbdd0b99883000e98458830a7438ce2be83"; # artifacts
    sha256 = "17k3kjyzrsxj9sbhf1a75w69167f4fy9ml3ghcx0cxkvnq65nkdx";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
