{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-14";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "d8a65036c9b4a5b59f08d863c4b615892e62c6ea"; # artifacts
    sha256 = "0l2snw9xff2j6l6zszz5kv60591cjqsj2ilcyx62grkca11wcvn7";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
