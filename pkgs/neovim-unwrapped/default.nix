final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8617101b6bf21bf27ba5194db5fb42c73ff67160";
    sha256 = "0dli87pk8zasagymc1g0fvaia9mvbxgxwb01p1k2g8f7a7jq2i43";
    fetchSubmodules = true;
  };

})
