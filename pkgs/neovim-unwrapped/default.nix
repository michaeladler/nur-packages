final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "356244d50ba01c63b3ac33057a69462c4029612c";
    sha256 = "0cminw39pb4mkky75vg2li80ac9zhihfj2xzm9ryqjn1psprrl54";
    fetchSubmodules = true;
  };

})
