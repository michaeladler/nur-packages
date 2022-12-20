final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "03166838abf23e3c2de55333fb2b9b0af34a2c56";
    sha256 = "1r61xwj5agszh4iz1a4308dq18q1ja1nccchjq804x4d0caf1inw";
    fetchSubmodules = true;
  };

})
