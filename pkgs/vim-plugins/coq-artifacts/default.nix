{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-26";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "49e09c3fa64d1a137feeefd6daa682bf54e9db25"; # artifacts
    sha256 = "04sjf7dnmvvbnpcf7ab1cvfc37rgdfhisxws2mfjhnkqpz16xpqz";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
