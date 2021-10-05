{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-artifacts";
  version = "unstable-2021-10-05";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq.artifacts";
    rev = "da0273f435052d3bb069113f9d05c93d2ee93db3"; # artifacts
    sha256 = "1mqrz735128mvjxx3a7fdnxplmd501ii6cp9jwld4wypi05y0lq7";
  };

  meta.homepage = "https://github.com/ms-jpq/coq.artifacts";
})
