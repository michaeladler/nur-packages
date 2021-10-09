{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-08";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "521a036013cd3f97ed155e8339ea08dfc95e1561"; # artifacts
    sha256 = "0ywhlzyh58m1q1idd4a1zs4dj2s2ri3zjsgp80iimfmjzk87z5nl";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
