{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-06";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "3681ba8eea0fd06ac18085cf5dd77b30959e22c9"; # artifacts
    sha256 = "0kavdj5hkcz8da9k6zmpxnyswnaxyqh62jkqw5a2cqpank940zgd";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
