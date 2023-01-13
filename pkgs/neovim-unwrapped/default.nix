final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "449c0762d351bca94438813f9226b8906b46adb5";
    sha256 = "0l75dj5f5fbdv0xlh5n609f4d2vzypsjajnmih00i0krs5kc04fl";
    fetchSubmodules = true;
  };

})
