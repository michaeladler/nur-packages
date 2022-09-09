final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2d6735d8cecc587eb5549f65260ee9ddeb8e1d78";
    sha256 = "1n56bdc8964sna207zl1l9q5gcrcgk7j4jcg77mx0djrw8pda2nk";
    fetchSubmodules = true;
  };

})
