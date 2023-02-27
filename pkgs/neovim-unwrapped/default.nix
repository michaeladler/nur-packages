final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d52a3f7c715cf4e3f2996dc16b405e1a63b7301d";
    sha256 = "0xccb03y344z1cfpb5y0xw0r466gx1lmh4jg1n1lpy11l6y2vqsk";
    fetchSubmodules = true;
  };

})
