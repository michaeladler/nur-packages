{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-18";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "899a7e316e7ccedd2c6e7a8962264c7d935a39d8"; # artifacts
    sha256 = "090vli09r55wm517iiwlaz0vxdw4yqzfw1qvlym2d5b3wlb0wfyc";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
