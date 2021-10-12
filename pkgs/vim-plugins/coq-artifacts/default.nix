{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-12";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "3021913f70bad499cf912fd4b257a7355ff1dccf"; # artifacts
    sha256 = "1201kf1r59q6hksy2pc4ynyywlsl0ynd7sy0xf4s3nh3199aw4in";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
