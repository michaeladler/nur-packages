{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-10";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "81b9528209b4e35ccfb1413ae936a3bf636cd129"; # artifacts
    sha256 = "0gvqbi8ricd5ambahv5gssf67s02s4p4fp8h2vg84vf6qlpjkpa3";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
