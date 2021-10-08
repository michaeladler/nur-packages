{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-07";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "13c7723525d88d591e970ea28a9aac778472f9aa"; # artifacts
    sha256 = "0fkbjchynkszkpqynn5d29k6lpskcsa0hhjkdnhb3cv9x8i2vbgr";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
