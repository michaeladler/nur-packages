{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-01";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "42d840a67e979a576730e6844c033a187f8be74a"; # artifacts
    sha256 = "0gnqadfahpnhycfkxijrmnm2bm93wswsqhprx1flr4r50088s1sq";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
