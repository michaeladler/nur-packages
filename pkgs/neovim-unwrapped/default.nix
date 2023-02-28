final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8acb3d742ce68adadf1def9e1d1bb5bfd671988c";
    sha256 = "1z4502k8cx2g669sqiqbqplixz5zf0vi9ym5790mxxb1q0rmx98y";
    fetchSubmodules = true;
  };

})
