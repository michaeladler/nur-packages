{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-27";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "70adba7881800affffc9baaed6bb0e2a9248298e"; # artifacts
    sha256 = "1j0pqmvfpjini9vcd1r7j3pya0sdq7y6bw3y74cfakrxsssikwiw";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
