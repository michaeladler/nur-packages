final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "090048bec9f80c46a6ce6ff05a419b15bc4bf028";
    sha256 = "07lvcnd2j5g378z04by18k27qhkszlmp96zgbj0wkspwknb8593n";
    fetchSubmodules = true;
  };

})
