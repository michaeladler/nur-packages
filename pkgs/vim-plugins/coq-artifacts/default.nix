{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-15";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "c6241711703999226586d0c483f66eea323014a5"; # artifacts
    sha256 = "1r4jsxn5mg79q4qhzkcm3wps4qqmibw1h6shrsz0i8bqywh5k5zf";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
