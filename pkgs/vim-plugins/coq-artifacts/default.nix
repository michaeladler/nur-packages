{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-25";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "157e79283bb1d21af357626909d5cbec649c6f97"; # artifacts
    sha256 = "0c5lp4fvc5mnsapq9phhrijjv4lyaw0b53xs8731slwb68w01zsr";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
