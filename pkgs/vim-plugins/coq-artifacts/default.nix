{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-02";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "b2570281611eadc9c0d3f34c7cb8fad5968c624b"; # artifacts
    sha256 = "0bppv5iivvp78pi1c6ldvinsbppp9yyg9pyxmfjn1zrn1p1gaxwj";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
