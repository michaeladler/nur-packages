final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "cd96fe06e188bcd6e64f78cb078a307fb45f31f0";
    sha256 = "1wy7q8ccvmi702jihhxrxmvrf3y1zfxwrn4i4jxi6lfcxcaaw100";
    fetchSubmodules = true;
  };

})
