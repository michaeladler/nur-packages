{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-16";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "1825dde740993aa4344db0b4a70b4825ed8581e6"; # artifacts
    sha256 = "0zgkkdajyv0dg3ra1w44r1vcshj7m8l9by810nk3rvriwc5jhniq";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
