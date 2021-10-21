{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-20";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "254ad1d7974f4f2b984e2b9dd4cc3cdc39b7e361"; # artifacts
    sha256 = "0h6mih64j9ac6kf761wyqk09a9as93ivh115imwbq8pm9fqxx65d";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
