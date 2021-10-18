{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-17";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "2159694c49fc853f27ef0a408840474db99ba178"; # artifacts
    sha256 = "09hgi7z9q94igp033d7vzs30kfr8gjx9kjpmnlnah0khqkbxsx1b";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
