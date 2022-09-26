final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-25";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "63be7651829f8b77c4974d08ebe09f7775e41a8a";
    sha256 = "19jky5wp0l7gbqiqw0557ddyaall37h6hm9wpkkrlfv8kprpqbsj";
    fetchSubmodules = true;
  };

})
