{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-22";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "10367dd93d592718840da25bb574c25395761115"; # artifacts
    sha256 = "0bq411cllfmjjl0hhawik2wcd6wkr0zf3zhw3aydw2hi6gslsypw";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
