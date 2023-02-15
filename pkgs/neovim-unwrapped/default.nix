final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1539f713639eb1c661da9f9003fd58bf4cbbc615";
    sha256 = "131jqy3xyrm7dq9gxxvq763bnpimlrbnysdgf23vyxzrkbwbwn3v";
    fetchSubmodules = true;
  };

})
