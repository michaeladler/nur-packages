{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-09";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "325799219fc08c0ae41304cb9f68cd6df504ee40"; # artifacts
    sha256 = "1sv5mjzc44d84iggaw5d1vbwpgw3mavjx991nchz5sxjqqmi4w79";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
