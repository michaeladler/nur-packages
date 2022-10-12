final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f175ca9f7cc29054b1c6fe1fd1076edd78af5684";
    sha256 = "0jxjsmpfmkynqgc6zh4ax6drhvmjrbfsb8vfx678zxi98xd5r8bc";
    fetchSubmodules = true;
  };

})
