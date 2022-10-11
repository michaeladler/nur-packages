final: prev:

prev.git.overrideAttrs (old: rec {
  version = "unstable-2022-10-02";

  src = final.fetchFromGitHub {
    owner = "git";
    repo = "git";
    rev = "3dcec76d9df911ed8321007b1d197c1a206dc164"; # tags/v*
    sha256 = "0sjdpqaiij859w6bia8b8w5pxxkrr19i66j8fcxawhch1krc80pr";
  };

})
