{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-12";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "5721aa8fc61b7c326f37a8a762ed79fafbee9a81"; # artifacts
    sha256 = "056xw8v6q6r09kgcj3sal7g6kdyh9rkpnqdqlavvwvy436kc4frd";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
