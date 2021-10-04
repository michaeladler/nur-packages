{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-03";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "a9f277ab0eee0bf1df09b7e03d4ec0cbd62fcc3c"; # artifacts
    sha256 = "0lm7lc55xi57ymrb3ldzckj68f0ls62xiq7gviq872p8x3q3srv4";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
