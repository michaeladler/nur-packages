final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d4e749f1b2358f12af3dd2481a0b9c36169cbeef";
    sha256 = "1fcyiv470b8harhd09lszmpk137j5zzd16ad1g8xah3hrxm9yg62";
    fetchSubmodules = true;
  };

})
