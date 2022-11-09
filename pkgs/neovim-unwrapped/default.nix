final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fae754073289566051433fae74ec65783f9e7a6a";
    sha256 = "0njmlmjyb96xb2751yq28cnj0rwb8097j1qm087irzq2ridshzp2";
    fetchSubmodules = true;
  };

})
